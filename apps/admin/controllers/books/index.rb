module Admin::Controllers::Books
  class Index
    include Admin::Action
    include SessionAuthentication

    expose :books

    def call(params)
      if logged_in?
        @books = BookRepository.all
      else
        redirect_to '/'
      end
    end
  end
end
