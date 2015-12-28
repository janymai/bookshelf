Lotus::Model.migration do
  change do
    create_table :users do
      primary_key :id
      column :name, String
      column :email, String
      column :password_digest, String
    end
  end
end
