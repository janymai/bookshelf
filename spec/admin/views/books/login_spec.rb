require 'spec_helper'
require_relative '../../../../apps/admin/views/books/login'

describe Admin::Views::Books::Login do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/admin/templates/books/login.html.erb') }
  let(:view)      { Admin::Views::Books::Login.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
