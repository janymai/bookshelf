require 'spec_helper'
require_relative '../../../../apps/admin/views/books/destroy'

describe Admin::Views::Books::Destroy do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/admin/templates/books/destroy.html.erb') }
  let(:view)      { Admin::Views::Books::Destroy.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
