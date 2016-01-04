require 'spec_helper'
require_relative '../../../../apps/admin/controllers/books/update'

describe Admin::Controllers::Books::Update do
  let(:action) { Admin::Controllers::Books::Update.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
