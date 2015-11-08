require 'spec_helper'
require_relative '../../../../apps/admin/controllers/book/new'

describe Admin::Controllers::Book::New do
  let(:action) { Admin::Controllers::Book::New.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
