class CreateMaterialTags < ActiveRecord::Migration[5.0]
  def change
    create_table :material_tags do |t|
      t.string :name, null: false
      t.string :display_name, null: false
      t.json :body, null: false
      t.timestamps
    end
  end
end
