class CreateLicenses < ActiveRecord::Migration[5.0]
  def change
    create_table :licenses do |t|
      t.string :name, null: false
      t.string :link, null: true
      t.text :content, null: false
      t.timestamps
    end
  end
end
