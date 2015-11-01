# bookshelf
Bookshelf app use Lotus Framework

## Wireframe

[Bookshelf wireframe](https://invis.io/AE4CBIJDG)

## Scenario

**Home page** User will see

* Book's image

* When user click on Book's image it will redirect to book detail page

**Book detail page** user will see

* Book's image

* Book's description

* Book's detail:
  * Publisher
  * Author
  * ISBN
  * Pages
  * Year
  * Language
  * File size
  * File type

* Button save to my library

**My Library**

* User will see the books user save to Library and user can edit title or description.

## Action

### Sprint 1 (1 week)

* Make layout by HTML/CSS use Bootstrap
  * Homepage
  * Book detail
  * My library

### Sprint 2 (1 week)

* Make behavior homepage redirect to book detail
  * User will see all the books
    > Action books/index
  * User click a book to see detail
    > Action books/show

* Test case:
  * User will see all the books
    * **Attributes**:
      > id

      > image_url

      > link
    * **Request** Attributes including:
      > id

      > image_url

      > link

    * **Type of data**
      > id       : int

      > image_url: string

      > link     : string
  * User click a book to see detail
    * **Attributes**:
      > id

      > description

      > publisher

      > by

      > ISBN

      > year

      > pages

      > languages

      > file size

      > file type

      > image
    * **Request** Attributes including:
      > id

      > description

      > publisher

      > by

      > ISBN

      > year

      > pages

      > languages

      > file size

      > file type

      > image

    * **Type of data**
      > id         : integer

      > description: string

      > publisher  : string

      > by         : string

      > ISBN       : string

      > year       : string

      > pages      : string

      > languages  : string

      > file size  : string

      > file type  : string

      > image      : string

### Sprint 3 (1 week)

* Make Admin page:
  * Hardcoded to user become admin:
    > Username: admin
    > Password: 12345678
  * Admin can create a book:
    > Action books/create
  * Admin can delete a book:
    > Action books/destroy
  * Admin can update a book:
    > Action books/update

* Test case:
  * Book create total will be increase
  * Book destroy total will be decrease
  * Book update information will change

## Sprint 4 (1 week)

* Make login/logout for user
  * Create auth_token by the way use `SecureRandom.base64` to generate
  * Make condition if user is current_user to use action in Bookshelf app

* Test case:
  * Test current user

## Sprint 5 (1 week)

* Pagination for products list
* I18n

## Sprint 6 (1 week)

* Deployment on heroku
* Asset compilation

## Sprint 7 (1 week)

* Caching

# Start

### Create .bowerrc to install bower
```
{
  "directory": "apps/web/public/stylesheets"
}
```

```
bower install bootstrap
```

### Create action

```
lotus g action web book#index

lotus g action web book#detail
```
### Create admin app

```
lotus g app admin
```

### Create action dashboard

```
lotus g action admin book#dashboard
```

### Create entity

At lib/bookshelf/entities create book.rb
We will define attributes need to create a book at entities.

```
require 'lotus/entity'

class Book
  include Lotus::Entity
  attributes :image_url, :link, :description, :publisher, :by, :isbn, :year,
             :page, :languages, :file_size, :file_type, :created_at, :updated_at
end
```

### Create repository

At lib/bookshelf/repository create book.rb
Repository help to handle with data by query

```
require 'lotus/repository'

class BookRepository
  include Lotus::Repository
end
```

### Add Gemfile sqlite3

```
group :development, :test do
  gem 'sqlite3'
end
```
### Create Database

At

```
# adapter type: :file_system, uri: ENV['BOOKSHELF_DATABASE_URL']
```

Edit `:file_system` into `:sql`. It will become

```
adapter type: :sql, uri: ENV['BOOKSHELF_DATABASE_URL']
```

Update .env.development & .env.test

At .env.development

```
BOOKSHELF_DATABASE_URL="file:///db/bookshelf_development"
```

Edit `file:///db/bookshelf_development` into `sqlite://db/bookshelf_development.db`

```
BOOKSHELF_DATABASE_URL="sqlite://db/bookshelf_development.db"
```

At .env.test

```
BOOKSHELF_DATABASE_URL="file:///db/bookshelf_test"
```

Edit `file:///db/bookshelf_test` into `sqlite://db/bookshelf_test.db`

```
BOOKSHELF_DATABASE_URL="sqlite://db/bookshelf_test.db"
```

### Create db
```
lotus db create
```

### Generator migrate

### Apply DB

```
lotus db apply
```

### Create seed db

In file `db/seed.db`

```
BookRepository.clear
20.times do
  book_attr = {
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
                file_size: '10.2MB',
                file_type: 1,

                created_at: DateTime.new(2015,2,4,4,5,6,'+7'),
                updated_at: DateTime.new(2015,2,4,4,5,6,'+7')
              }

  book = Book.new(book_attr)
  BookRepository.persist(book)
end
```

### Define rake task db

update Rakefile
add rake task db:seed to load db/seed.rb

```
require 'rake'
require 'rake/testtask'
require 'lotus/environment'
require Lotus::Environment.new.env_config

Rake::TestTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.libs    << 'spec'
end

task default: :test
task spec: :test

namespace :db do
  task :seed do
    load 'db/seed.rb'
  end
end
```

### Render all book on view

#### Get book from controller
apps/web/contrllers/book/index.rb

```
module Web::Controllers::Books
  class Index
    include Web::Action
    expose :books // expose @books into books (use books to render at template)

    def call(params)
      @books = BookRepository.all
    end
  end
end
```

#### Render book at template
apps/web/templates/book/index.html.rb
```
<div class="container lotus-book-container">

  <div class="row">
    <% if books.any? %>
      <% books.each do |book|%>
        <div class="col-sm-6 col-md-3">
          <%=
            link_to(book.link, class: 'thumbnail') do
              img(src: "book.image_url", alt: "lotus bookshelf")
            end
          %>
        </div>
      <% end %>
    <% end %>
  </div>
</div>
```

### See book detail

#### At config update routes
apps/web/config/router.rb

```
get '/books', to: 'books#show'
```

#### Get book from controller
apps/web/contrllers/book/show.rb

```
module Web::Controllers::Books
  class Show
    include Web::Action
    expose :book

    params do
      param :id, type: Integer, presence: true
    end

    def call(params)
      @book = BookRepository.find(book_id)
    end

    private

    def book_id
      params.get(:id)
    end
  end
end

```

#### Render book at template
apps/web/templates/book/show.html.rb
```
<div class="container" id="book-<%= book.id %>">
  <div class="row">
    <div class="col-md-4 lotus-book-container">
      <a href="#" class="thumbnail">
        <img src="../public/images/image-default.jpg" alt="lotus bookshelf">
      </a>
    </div>

    <div class="col-md-7 col-md-offset-1">
      <h2 class="page-header">Description</h2>
      <div>
        <p><big><%= book.description %></big></p>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="col-md-offset-5 col-md-7">
      <h2 class="page-header">Book Detail</h2>

      <div class="">
        <div class="row">
          <div class="col-md-5">
            <p><big>Publisher</big></p>
          </div>
          <div class="col-md-7">
            <p><big><%= book.publisher %></big></p>
          </div>
        </div>
        <div class="row">
          <div class="col-md-5">
            <p><big>Author</big></p>
          </div>
          <div class="col-md-7">
            <p><big><%= book.by %></big></p>
          </div>
        </div>
        <div class="row">
          <div class="col-md-5">
            <p><big>ISBN</big></p>
          </div>
          <div class="col-md-7">
            <p><big><%= book.isbn %></big></p>
          </div>
        </div>
        <div class="row">
          <div class="col-md-5">
            <p><big>Pages</big></p>
          </div>
          <div class="col-md-7">
            <p><big><%= book.pages %></big></p>
          </div>
        </div>
        <div class="row">
          <div class="col-md-5">
            <p><big>Year</big></p>
          </div>
          <div class="col-md-7">
            <p><big><%= book.year.strftime("%Y") %>MB</big></p>
          </div>
        </div>
        <div class="row">
          <div class="col-md-5">
            <p><big>Language</big></p>
          </div>
          <div class="col-md-7">
            <p><big><%= book.languages %></big></p>
          </div>
        </div>
        <div class="row">
          <div class="col-md-5">
            <p><big>File size</big></p>
          </div>
          <div class="col-md-7">
            <p><big><%= book.file_size %></big></p>
          </div>
        </div>
        <div class="row">
          <div class="col-md-5">
            <p><big>File type</big></p>
          </div>
          <div class="col-md-7">
            <p><big><%= book.file_type %></big></p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
```
