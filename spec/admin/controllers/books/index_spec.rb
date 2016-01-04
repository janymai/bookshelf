require 'spec_helper'
require_relative '../../../../apps/admin/controllers/books/index'

describe Admin::Controllers::Books::Index do
  let(:action) { Admin::Controllers::Books::Index.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
