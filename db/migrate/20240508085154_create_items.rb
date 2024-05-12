class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :identifier, null: false
      t.string :label, null: false
      t.string :description
      t.float :price
      t.integer :item_type, default: 0

      t.timestamps
    end
  end
end
