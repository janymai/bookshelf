module Admin::Controllers::Books
  class Update
    include Admin::Action

    params do
      param :id, type: Integer, presence: true
      param :book do
        param :image_url
        param :link
        param :description
        param :publisher
        param :by
        param :isbn
        param :year
        param :pages
        param :languages
        param :file_size
        param :file_type
      end
    end

    def call(params)
      book_entity.update(book_data_update)
      redirect_to routes.path(:books)
    end

    private

    def book_entity
      BookRepository.find(book_id)
    end

    def book_data_update
      params.get(:book)
    end

    def book_id
      params.get(:id)
    end
  end
end
