class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.date :shipping_date
      t.string :shipping_address
      t.boolean :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
