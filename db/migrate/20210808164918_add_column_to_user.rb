class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :password_confiramtion, :string
  end
end
