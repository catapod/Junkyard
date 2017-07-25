class CreateMaterials < ActiveRecord::Migration[5.0]
  def change
    create_table :materials do |t|
      t.belongs_to :rightholder, index: true
      t.references :owner, index: true, null: false, foreign_key: { to_table: :users }
      t.string :original_link, null: true
      t.string :caption_original, null: false
      t.string :caption_translated, null: true
      t.text :annotation_original, null: false
      t.text :annotation_translated, null: true
      t.belongs_to :state, index: true, null: false
      t.belongs_to :license, index: true, null: false
      t.string :original_language, null: false
      t.string :translation_language, null: false
      t.timestamps
    end
  end
end
