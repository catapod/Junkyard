class CreateMaterialTagsMaterials < ActiveRecord::Migration[5.0]
  def change
    create_table :material_tags_materials do |t|
      t.belongs_to :material, index: true
      t.belongs_to :material_tag, index: true
    end
  end
end
