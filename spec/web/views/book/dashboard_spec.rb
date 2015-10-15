require 'spec_helper'
require_relative '../../../../apps/web/views/book/dashboard'

describe Web::Views::Book::Dashboard do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/book/dashboard.html.erb') }
  let(:view)      { Web::Views::Book::Dashboard.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
