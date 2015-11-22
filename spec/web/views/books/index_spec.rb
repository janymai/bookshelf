require 'spec_helper'
require_relative '../../../../apps/web/views/books/index'

describe Web::Views::Books::Index do
  let(:book1)     { { id: 1,
                      image_url: 'http://it-ebooks.org/img/books/wrox/professional_php6.jpg'
                  } }
  let(:book2)     { { id: 2,
                      image_url: 'http://it-ebooks.org/img/books/wrox/professional_php6.jpg'
                  } }
  let(:books)     { [ OpenStruct.new(book1), OpenStruct.new(book2)] }
  let(:exposures) { { books: books } }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/books/index.html.erb') }
  let(:view)      { Web::Views::Books::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #books" do
    view.books.must_equal exposures.fetch(:books)
  end

  it "exposes length" do
    view.books.length.must_equal 2
  end

  describe "view template" do
    it 'each book render' do
      rendered.must_match /\<a href="\/books\/1" class="thumbnail">/
      rendered.must_match /\<img src="http:\/\/it-ebooks.org\/img\/books\/wrox\/professional_php6.jpg" alt="lotus bookshelf">/
      rendered.must_match /\<\/a>/
    end
  end
end
