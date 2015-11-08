require 'spec_helper'
require_relative '../../../../apps/admin/controllers/books/new'

describe Admin::Controllers::Books::New do
  let(:action) { Admin::Controllers::Books::New.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
