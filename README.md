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

### Create repository

### Add Gemfile sqlite3

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
