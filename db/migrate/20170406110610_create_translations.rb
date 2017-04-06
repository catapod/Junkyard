class CreateTranslations < ActiveRecord::Migration[5.0]
  def change
    create_table :translations do |t|
      t.belongs_to :slice, index: true
      t.references :translator, index: true, foreign_key: { to_table: :users }
      t.text :body, null: false
      t.timestamps
    end
  end
end
