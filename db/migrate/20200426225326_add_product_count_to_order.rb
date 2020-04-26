class AddProductCountToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :order_products, :amount, :integer
  end
end
