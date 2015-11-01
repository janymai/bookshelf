require 'spec_helper'
require_relative '../../../../apps/admin/views/book/login'

describe Admin::Views::Book::Login do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/admin/templates/book/login.html.erb') }
  let(:view)      { Admin::Views::Book::Login.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
