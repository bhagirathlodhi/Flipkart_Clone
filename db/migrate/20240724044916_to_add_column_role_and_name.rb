class ToAddColumnRoleAndName < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :role, :integer
    add_column :users, :name, :string
  end
end
