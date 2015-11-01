require 'spec_helper'
require_relative '../../../../apps/admin/controllers/book/login'

describe Admin::Controllers::Book::Login do
  let(:action) { Admin::Controllers::Book::Login.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
