get '/book', to: 'book#login'
get '/', to: 'books#index'
get '/books', to: 'books#show'
resources :books, only: [:index, :show]
