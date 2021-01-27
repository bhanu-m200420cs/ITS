class AddAdminToIncharges < ActiveRecord::Migration[6.0]
  def change
    add_column :incharges, :admin, :boolean, default: false
  end
end
