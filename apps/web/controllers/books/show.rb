module Web::Controllers::Books
  class Show
    include Web::Action
    expose :book

    params do
      param :id, type: Integer, presence: true
    end

    def call(params)
      @book = BookRepository.find(book_id)
    end

    private

    def book_id
      params.get(:id)
    end
  end
end
