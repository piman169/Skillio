class AddPasswordToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :image_name, :string
    add_column :users, :password_digest, :string
  end
end
