require 'spec_helper'
require_relative '../../../../apps/web/controllers/books/delete'

describe Web::Controllers::Books::Delete do
  let(:action) { Web::Controllers::Books::Delete.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
