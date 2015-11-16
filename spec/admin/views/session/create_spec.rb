require 'spec_helper'
require_relative '../../../../apps/admin/views/session/create'

describe Admin::Views::Session::Create do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/admin/templates/session/create.html.erb') }
  let(:view)      { Admin::Views::Session::Create.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
