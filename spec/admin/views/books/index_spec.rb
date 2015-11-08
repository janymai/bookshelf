require 'spec_helper'
require_relative '../../../../apps/admin/views/books/index'

describe Admin::Views::Books::Index do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/admin/templates/books/index.html.erb') }
  let(:view)      { Admin::Views::Books::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
