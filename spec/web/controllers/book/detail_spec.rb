require 'spec_helper'
require_relative '../../../../apps/web/controllers/book/detail'

describe Web::Controllers::Book::Detail do
  let(:action) { Web::Controllers::Book::Detail.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
