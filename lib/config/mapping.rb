collection :books do
  entity Book
  repository BookRepository

  attribute :id, Integer
  attribute :image_url, String
  attribute :link, String
  attribute :description, String
  attribute :publisher, String
  attribute :by, String
  attribute :isbn, String
  attribute :year, DateTime
  attribute :page, Integer
  attribute :languages, String
  attribute :file_size, String
  attribute :file_type, Integer
end
