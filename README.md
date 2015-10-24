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
