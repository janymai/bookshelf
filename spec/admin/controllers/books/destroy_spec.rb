require 'spec_helper'
require_relative '../../../../apps/admin/controllers/books/destroy'

describe Admin::Controllers::Books::Destroy do
  let(:action) { Admin::Controllers::Books::Destroy.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
