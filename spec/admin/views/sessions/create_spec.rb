require 'spec_helper'
require_relative '../../../../apps/admin/views/sessions/create'

describe Admin::Views::Sessions::Create do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/admin/templates/sessions/create.html.erb') }
  let(:view)      { Admin::Views::Sessions::Create.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
