class AddUserToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :incharges, :user, :boolean, default: true
  end
end
