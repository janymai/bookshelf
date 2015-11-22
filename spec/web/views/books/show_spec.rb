require 'spec_helper'
require_relative '../../../../apps/web/views/books/show'

describe Web::Views::Books::Show do
  let(:hash_book)  {
                    { id: 1,
                      image_url: 'http://it-ebooks.org/img/books/wrox/professional_php6.jpg',
                      link: 'http://it-ebooks.org/book/wrox/professional_php6',
                      description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit',
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

  let(:book)      { OpenStruct.new(hash_book) }
  let(:exposures) { Hash[book: book] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/books/show.html.erb') }
  let(:view)      { Web::Views::Books::Show.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #book" do
    view.book.must_equal exposures.fetch(:book)
  end

  describe 'view template' do
    it 'render image of a book as thumbnail at <a>' do
      rendered.must_match /\<a href="#" class="thumbnail">/
      rendered.must_match /\<img src="http:\/\/it-ebooks.org\/img\/books\/wrox\/professional_php6.jpg" alt="lotus bookshelf"\/>/
      rendered.must_match /\<\/a>/
    end

    it 'render description of a book at <div>' do
      rendered.must_match /\<h2 class="page-header">Description<\/h2>/
      rendered.must_match /\<p><big>Lorem ipsum dolor sit amet, consectetur adipisicing elit<\/big><\/p>/
    end

    it 'render publisher of a book at <div>' do
      rendered.must_match /\<p><big>Publisher<\/big><\/p>/
      rendered.must_match /<p><big>Wrox<\/big><\/p>/
    end

    it 'render author of a book at <div>' do
      rendered.must_match /\<p><big>Author<\/big><\/p>/
      rendered.must_match /<p><big>Ed Lecky-Thompson, Steven D. Nowicki<\/big><\/p>/
    end

    it 'render isbn of a book at <div>' do
      rendered.must_match /\<p><big>ISBN<\/big><\/p>/
      rendered.must_match /<p><big>9780470395097<\/big><\/p>/
    end

    it 'render page of a book at <div>' do
      rendered.must_match /\<p><big>Pages<\/big><\/p>/
      rendered.must_match /<p><big>744<\/big><\/p>/
    end

    it 'render year of a book at <div>' do
      rendered.must_match /\<p><big>Year<\/big><\/p>/
      rendered.must_match /<p><big>2009<\/big><\/p>/
    end

    it 'render languages of a book at <div>' do
      rendered.must_match /\<p><big>Language<\/big><\/p>/
      rendered.must_match /<p><big>English<\/big><\/p>/
    end

    it 'render file_size of a book at <div>' do
      rendered.must_match /\<p><big>File size<\/big><\/p>/
      rendered.must_match /<p><big>744<\/big><\/p>/
    end

    it 'render file_type of a book at <div>' do
      rendered.must_match /\<p><big>File type<\/big><\/p>/
      rendered.must_match /<p><big>10.2<\/big><\/p>/
    end
  end

  describe '#year' do
    it 'returns year' do
      view.year.must_equal "2009"
    end
  end
end
