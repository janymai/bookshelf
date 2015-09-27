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
  * Languge
  * File zie
  * File type

* Button save to my library

**My Librabry**

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

* Make behavior save book to my library
  * User will save the books to my library
    > Action lib/create
  * When book belong to the user's library. User can edit book's title and description
    > Action lib/:id/edit

* Test case:
  * User will see all the books
    * **Attributes**:
      > id         
      
      > title      
      
      > description
    
    * **Request** Attributes including:
      > id         
      
      > title      
      
      > description
      
    * **Type of data**:
      > id         : integer
      
      > title      : string
      
      > description: string

    * **Save**:
      > When save book in to lib -> book in database total have to grow up by 1
    * **Edit**:
      > Edit title title should be change
      > Edit description should be change

## Sprint 4 (1 week)

* Make login/logout for user
  * Create auth_token by the way use `SecureRandom.base64` to generate
  * Add it into header
  * Make condition if user is current_user to use action in Bookshelf app
  
* Test case:
  * Test current user
