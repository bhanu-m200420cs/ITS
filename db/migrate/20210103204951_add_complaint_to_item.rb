class AddComplaintToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :complaint, :boolean, default: false
    add_column :items, :description, :text, default: "NA"
  end
end
