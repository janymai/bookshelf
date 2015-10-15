1) tao .bowerrc link folder se install bootstrap vao do

2) bower install bootstrap

3) Tao action
lotus g action web book#index

lotus g action web book#detail

4)Tao app admin

lotus g app admin

5) Tao action dashboard

lotus g action admin book#dashboard

root default cua no la
# get '/book', to: 'book#dashboard'

e edit thanh

get '/dashboard', to: 'book#dashboard'

nhung em vao localhost: 2300/dashboard no ko work
