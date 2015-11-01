require 'byebug'
module Admin::Controllers::Book
  class Login
    include Admin::Action

    params do
      param :user do
        param :name, presence: true
        param :password, presence: true
      end
    end

    def call(params)
      if check_login
        puts 'login'
      else
        puts 'not login'
      end
    end

    def post_params
      params.get(:user)
    end

    def check_login
      post_params[:name] == 'admin' && post_params[:password] == ENV['ADMIN_PASSWORD']
    end
  end
end
