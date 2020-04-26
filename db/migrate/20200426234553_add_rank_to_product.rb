class AddRankToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products , :rank_sum, :integer , default: 0
    add_column :products , :rank_count, :integer , default: 0
  end
end
