class AddInchargeIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :incharge_id, :integer
    add_index :items, :incharge_id
  end
end
