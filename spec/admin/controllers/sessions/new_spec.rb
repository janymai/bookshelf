require 'spec_helper'
require_relative '../../../../apps/admin/controllers/sessions/new'

describe Admin::Controllers::Sessions::New do
  let(:action) { Admin::Controllers::Sessions::New.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
