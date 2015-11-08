require 'spec_helper'
require_relative '../../../../apps/admin/views/book/new'

describe Admin::Views::Book::New do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/admin/templates/book/new.html.erb') }
  let(:view)      { Admin::Views::Book::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
