require 'byebug'
module Admin::Controllers::Sessions
  class Create
    include Admin::Action
    include MyAuthentication

    def call(params)

      email = params[:user]["email"]
      password = params[:user]["password"]
      user = UserRepository.user(email,password)

      if user
        byebug
        login(user)
        redirect_to '/admin/books'
      else
        redirect_to '/'
      end
    end
  end
end
