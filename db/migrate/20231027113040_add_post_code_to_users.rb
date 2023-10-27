class AddPostCodeToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :post_code, :string
  end
end
