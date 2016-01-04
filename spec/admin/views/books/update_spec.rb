require 'spec_helper'
require_relative '../../../../apps/admin/views/books/update'

describe Admin::Views::Books::Update do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/admin/templates/books/update.html.erb') }
  let(:view)      { Admin::Views::Books::Update.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
