module Admin::Controllers::Books
  class New
    include Admin::Action
    expose :book
    def call(params)
      @book = Book.new
    end
  end
end
