require 'spec_helper'
require_relative '../../../../apps/admin/controllers/book/dashboard'

describe Admin::Controllers::Book::Dashboard do
  let(:action) { Admin::Controllers::Book::Dashboard.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
