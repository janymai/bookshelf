require 'spec_helper'
require_relative '../../../../apps/admin/views/book/dashboard'

describe Admin::Views::Book::Dashboard do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/admin/templates/book/dashboard.html.erb') }
  let(:view)      { Admin::Views::Book::Dashboard.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
