get '/', to: 'books#index'
resources :books, except: [:show]
