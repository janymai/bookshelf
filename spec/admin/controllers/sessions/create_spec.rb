require 'spec_helper'
require_relative '../../../../apps/admin/controllers/sessions/create'

describe Admin::Controllers::Sessions::Create do
  let(:action) { Admin::Controllers::Sessions::Create.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
