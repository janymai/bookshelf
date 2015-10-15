require 'spec_helper'
require_relative '../../../../apps/web/controllers/book/index'

describe Web::Controllers::Book::Index do
  let(:action) { Web::Controllers::Book::Index.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
