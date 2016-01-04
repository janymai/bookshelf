require 'spec_helper'
require_relative '../../../../apps/admin/controllers/books/login'

describe Admin::Controllers::Books::Login do
  let(:action) { Admin::Controllers::Books::Login.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
