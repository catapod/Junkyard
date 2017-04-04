class CreateSlices < ActiveRecord::Migration[5.0]
  def change
    create_table :slices do |t|
      t.belongs_to :material, index: true
      t.integer :material_position, null: false
      t.belongs_to :slice_type, index: true
      t.boolean :translatable, null: false
      t.text :body, null: false
      t.timestamps
    end
  end
end
