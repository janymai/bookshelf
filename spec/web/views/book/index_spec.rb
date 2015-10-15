require 'spec_helper'
require_relative '../../../../apps/web/views/book/index'

describe Web::Views::Book::Index do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/book/index.html.erb') }
  let(:view)      { Web::Views::Book::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
