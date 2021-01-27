class AddApprovedToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :approved, :boolean, default: false
  end
end
