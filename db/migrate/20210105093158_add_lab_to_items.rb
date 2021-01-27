class AddLabToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :lab_name, :string
  end
end
