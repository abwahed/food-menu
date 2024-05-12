class CreateModifierGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :modifier_groups do |t|
      t.string :identifier, null: false
      t.string :label, null: false
      t.integer :selection_required_min
      t.integer :selection_required_max

      t.timestamps
    end
  end
end
