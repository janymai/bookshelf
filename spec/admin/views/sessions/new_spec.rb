require 'spec_helper'
require_relative '../../../../apps/admin/views/sessions/new'

describe Admin::Views::Sessions::New do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/admin/templates/sessions/new.html.erb') }
  let(:view)      { Admin::Views::Sessions::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
