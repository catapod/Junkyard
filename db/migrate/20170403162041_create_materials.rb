class CreateMaterials < ActiveRecord::Migration[5.0]
  def change
    create_table :materials do |t|
      t.string :original_link, null: true
      t.string :caption_original, null: false
      t.string :caption_translated, null: true
      t.text   :annotation_original, null: false
      t.text   :annotation_translated, null: true
      t.string :original_language, null: false
      t.string :translated_language, null: false
      t.string :translated_language, null: false
      t.string :tags, array: true, null: false
      t.timestamps
    end
  end
end
