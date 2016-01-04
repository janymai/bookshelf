require 'spec_helper'
require_relative '../../../../apps/admin/views/books/create'

describe Admin::Views::Books::Create do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/admin/templates/books/create.html.erb') }
  let(:view)      { Admin::Views::Books::Create.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
