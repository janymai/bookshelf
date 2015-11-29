require 'spec_helper'
require_relative '../../../../apps/admin/controllers/books/create'

describe Admin::Controllers::Books::Create do
  let(:action) { Admin::Controllers::Books::Create.new }
  # let(:params) { Hash[] }
  let(:params) {
    {
      image_url: 'http://it-ebooks.org/img/books/wrox/professional_php6.jpg',
      link: 'http://it-ebooks.org/book/wrox/professional_php6',
      description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
                    nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
                    reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
                    pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa
                    qui officia deserunt mollit anim id est laborum.',
      publisher: 'Wrox',
      by: 'Ed Lecky-Thompson, Steven D. Nowicki',
      isbn: '9780470395097',
      year: DateTime.new(2009),
      pages: 744,
      languages: 'English',
      file_size: '10.2',
      file_type: 1
    }
  }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
