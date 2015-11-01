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
