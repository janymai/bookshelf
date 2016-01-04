require 'byebug'
module Admin::Controllers::Books
  class Edit
    include Admin::Action
    expose :book

    params do
      param :id, type: Integer, presence: true
    end

    def call(params)
      @book = BookRepository.find(book_id)
    end

    def book_id
      params.get(:id)
    end
  end
end
