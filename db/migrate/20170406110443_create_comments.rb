class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.belongs_to :chunk, index: true, null: false
      t.references :commentator, index: true, null: false, foreign_key: { to_table: :users }
      t.text :body, null: false
      t.timestamps
    end
  end
end
