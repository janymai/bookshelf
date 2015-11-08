require 'spec_helper'
require_relative '../../../../apps/admin/views/books/new'

describe Admin::Views::Books::New do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/admin/templates/books/new.html.erb') }
  let(:view)      { Admin::Views::Books::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
