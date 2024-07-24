class ToAddColumnNumField < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :no_of_product, :integer
  end
end
