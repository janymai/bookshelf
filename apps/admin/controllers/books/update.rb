module Admin::Controllers::Books
  class Update
    include Admin::Action

    params do
      param :id, type: Integer, presence: true
    end

    def call(params)
      BookRepository.update(book_entity)
    end

    private

    def book_entity
      BookRepository.find(book_id)
    end

    def book_id
      params.get(:id)
    end
  end
end
