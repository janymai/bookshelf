get '/books', to: 'books#destroy'
get '/', to: 'books#index'
resources :books, only: [:index, :show, :destroy]
