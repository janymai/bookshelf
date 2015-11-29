module Admin::Controllers::Books
  class Create
    include Admin::Action
    include SessionAuthentication

    params do
      param :book do
        param :image_url, presence: true
        param :link, presence: true
        param :description, presence: true
        param :publisher, presence: true
        param :by, presence: true
        param :isbn, presence: true
        param :year, presence: true
        param :pages, presence: true
        param :languages, presence: true
        param :file_size, presence: true
        param :file_type, presence: true
      end
    end

    def call(params)
      if logged_in?
        create_book
        redirect_to routes.path(:books)
      else
        redirect_to routes.path(:login)
      end
    end

    private

    def book_params
      params.get(:book)
    end

    def create_book
      book = Book.new(book_params)
      BookRepository.create(book)
    end
  end
end
