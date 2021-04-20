class AddEmailToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :email, :string, unique: true, index: true
  end
end
