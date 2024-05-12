class CreateSections < ActiveRecord::Migration[7.1]
  def change
    create_table :sections do |t|
      t.string :identifier, null: false
      t.string :label, null: false
      t.string :description

      t.timestamps
    end
  end
end
