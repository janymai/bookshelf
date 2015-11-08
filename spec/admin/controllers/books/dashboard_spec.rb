require 'spec_helper'
require_relative '../../../../apps/admin/controllers/books/dashboard'

describe Admin::Controllers::Books::Dashboard do
  let(:action) { Admin::Controllers::Books::Dashboard.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
