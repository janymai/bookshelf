require 'spec_helper'
require_relative '../../../../apps/admin/views/books/edit'

describe Admin::Views::Books::Edit do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/admin/templates/books/edit.html.erb') }
  let(:view)      { Admin::Views::Books::Edit.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
