module Web::Controllers::Book
  class Index
    include Web::Action
    expose :books

    def call(params)
      @books = BookRepository.all
    end
  end
end
