require 'spec_helper'
require_relative '../../../../apps/web/views/book/detail'

describe Web::Views::Book::Detail do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/book/detail.html.erb') }
  let(:view)      { Web::Views::Book::Detail.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
