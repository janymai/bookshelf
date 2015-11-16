require 'spec_helper'
require_relative '../../../../apps/admin/controllers/books/create'

describe Admin::Controllers::Books::Create do
  let(:action) { Admin::Controllers::Books::Create.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
