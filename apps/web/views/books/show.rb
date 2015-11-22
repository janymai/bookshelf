module Web::Views::Books
  class Show
    include Web::View

    # view se xu ly nhung method render san cho minh,
    # lay method nay binding o template
    def year
      book.year.strftime("%Y")
    end
  end
end
