require 'lotus/entity'

class Book
  include Lotus::Entity
  attributes :image_url, :link, :description, :publisher, :by, :isbn, :year,
             :page, :languages, :file_size, :file_type, :created_at, :updated_at
end
