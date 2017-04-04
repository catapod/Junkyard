class CreateMaterials < ActiveRecord::Migration[5.0]
  def change
    create_table :materials do |t|
      t.references :rightholder, index: true, foreign_key: { to_table: :rightholders }
      t.references :owner, index: true, foreign_key: { to_table: :users }
      t.string :original_link, null: true
      t.string :caption_original, null: false
      t.string :caption_translated, null: true
      t.text   :annotation_original, null: false
      t.text   :annotation_translated, null: true
      t.references :state, index: true, foreign_key: { to_table: :states }
      t.references :license, index: true, foreign_key: { to_table: :licenses }
      t.string :original_language, null: false
      t.string :translated_language, null: false
      t.string :translated_language, null: false
      t.string :tags, array: true, null: false
      t.timestamps
    end
  end
end
