require 'spec_helper'
require_relative '../../../../apps/admin/controllers/books/edit'

describe Admin::Controllers::Books::Edit do
  let(:action) { Admin::Controllers::Books::Edit.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
