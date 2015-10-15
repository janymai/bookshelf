require 'spec_helper'
require_relative '../../../../apps/web/controllers/book/dashboard'

describe Web::Controllers::Book::Dashboard do
  let(:action) { Web::Controllers::Book::Dashboard.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
