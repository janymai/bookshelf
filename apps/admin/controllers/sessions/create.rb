require 'bcrypt'
module Admin::Controllers::Sessions
  class Create
    include Admin::Action
    include BCrypt

    params do
      param :user do
        param :email, presence: true
        param :password, presence: true
      end
    end

    def initialize(repository: UserRepository)
      @repository = repository
    end

    def call(params)
      _validate_params!
      _find_user!
      if _authenticated_user?(@user, password)
        save_user_to_session(@user)
        redirect_to '/admin/books'
      else
        redirect_to '/'
      end
    end

    private

    def _find_user!
      @user = @repository.find_by_email(email)
      raise 'User not found' unless @user
    end

    def _validate_params!
      raise 'Invalid parameters' if !params.valid?
    end

    def email
      params.get('user.email')
    end

    def password
      params.get('user.password')
    end

    def _authenticated_user?(user, password)
      Password.new(user.password) == password
    end
  end
end
