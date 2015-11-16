require 'spec_helper'
require_relative '../../../../apps/admin/views/session/new'

describe Admin::Views::Session::New do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/admin/templates/session/new.html.erb') }
  let(:view)      { Admin::Views::Session::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
