require 'spec_helper'
require_relative '../../../../apps/admin/views/books/dashboard'

describe Admin::Views::Books::Dashboard do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/admin/templates/books/dashboard.html.erb') }
  let(:view)      { Admin::Views::Books::Dashboard.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
