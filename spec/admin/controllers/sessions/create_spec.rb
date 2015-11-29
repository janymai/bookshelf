require 'spec_helper'
require_relative '../../../../apps/admin/controllers/sessions/create'

describe Admin::Controllers::Sessions::Create do
  before do
    class FakeUserRepository
      def self.find_by_email(email)
        nil
      end
      def self.find(id)
        nil
      end
    end
  end

  let(:action) { Admin::Controllers::Sessions::Create.new(repository: FakeUserRepository) }

  describe 'when email is missing' do
    let(:params) { { user: {password: "password"} } }
    it 'throws exception' do
      exception = -> { action.call(params) }.must_raise(RuntimeError)
      exception.message.must_equal 'Invalid parameters'
    end
  end

  describe 'when password is missing' do
    let(:params) { { user: {email: "lotus@gmail.com" } } }
    it 'throws exception' do
      exception = -> { action.call(params) }.must_raise(RuntimeError)
      exception.message.must_equal 'Invalid parameters'
    end
  end

  describe 'when email does not match any user' do
    before do
      class FakeUserRepository
        def self.find_by_email(email)
          nil
        end

        def self.find(id)
          nil
        end
      end
    end

    let(:params) { { user: {email: "lotus@gmail.com", password: "password" } } }

    it 'throws exception' do
      exception = -> { action.call(params) }.must_raise(RuntimeError)
      exception.message.must_equal 'User not found'
    end
  end

  describe 'when password does not match' do
    before do
      class FakeUserRepository
        def self.find_by_email(email)
          User.new(email: email, password: "password")
        end

        def self.find(id)
          nil
        end
      end
    end

    let(:params) { { user: {email: "lotus@gmail.com", password: "not password" } } }

    it 'redirects to root' do
      response = action.call(params)
      response[0].must_equal 302
      response[1]['Location'].must_equal '/'
    end
  end

  describe 'when email and password is matched' do
    before do
      class FakeUserRepository
        def self.find_by_email(email)
          User.new(email: "lotus@gmail.com", password: "password")
        end

        def self.find(id)
          User.new(id: 1, email: "lotus@gmail.com", password: "password")
        end
      end
    end

    let(:params) { { user: {email: "lotus@gmail.com", password: "password" } } }

    it 'redirects to admin book' do
      response = action.call(params)
      response[0].must_equal 302
      response[1]['Location'].must_equal '/admin/books'
    end
  end

end
