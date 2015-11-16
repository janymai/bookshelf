Lotus::Model.migration do
  change do
    create_table :books do
      primary_key :id
      column :image_url, String
      column :link, String
      column :description, String
      column :publisher, String
      column :by, String
      column :isbn, String
      column :year, DateTime
      column :pages, Integer
      column :languages, String
      column :file_size, String
      column :file_type, Integer
      column :created_at, DateTime
      column :updated_at, DateTime
    end
  end
end
