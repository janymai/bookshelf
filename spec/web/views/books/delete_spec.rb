require 'spec_helper'
require_relative '../../../../apps/web/views/books/delete'

describe Web::Views::Books::Delete do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/books/delete.html.erb') }
  let(:view)      { Web::Views::Books::Delete.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
