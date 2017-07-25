class CreateChunks < ActiveRecord::Migration[5.0]
  def change
    create_table :chunks do |t|
      t.belongs_to :material, index: true, null: false
      t.integer :material_position, null: false
      t.belongs_to :chunk_type, index: true, null: false
      t.boolean :translatable, null: false
      t.text :body, null: false
      t.timestamps
    end
  end
end
