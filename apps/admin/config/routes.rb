get '/books', to: 'books#destroy'
get '/sessions', to: 'sessions#create'
get '/login', to: 'sessions#new'
resources :books, except: [:show]
resources :sessions
