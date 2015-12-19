module Admin::Controllers::Books
  class Destroy
    include Admin::Action
    include SessionAuthentication

    params do
      param :id, type: Integer, presence: true
    end

    def call(params)
      book_entity?
      success = BookRepository.delete(@book)
      unless success
        logger.error "Can not delete book."
        self.status = 402
      end
    end

    private

    def book_entity?
      @book = BookRepository.find(book_id)
      raise 'Book not found' unless @book
    end

    def book_id
      params.get(:id)
    end
  end
end
