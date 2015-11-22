get '/book', to: 'book#login'
get '/', to: 'books#index'
resources :books, only: [:index, :show]
