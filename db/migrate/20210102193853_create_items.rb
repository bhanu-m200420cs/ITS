class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.string :model_number
      t.string :make
      t.date :installation_date
      t.date :warranty
      t.string :status

      t.timestamps
    end
  end
end
