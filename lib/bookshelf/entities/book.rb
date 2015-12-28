require 'lotus/entity'

class Book
  include Lotus::Entity
  attributes :name, :image_url, :link, :description, :publisher, :by, :isbn, :year,
             :pages, :languages, :file_size, :file_type, :created_at, :updated_at
end
