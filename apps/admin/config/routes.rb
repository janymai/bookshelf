# get '/books', to: 'books#edit'
get '/sessions', to: 'sessions#create'
get '/login', to: 'sessions#new'
# get '/books', to: 'books#destroy'
resources :books
resources :sessions
