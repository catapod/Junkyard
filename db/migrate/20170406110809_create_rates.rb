class CreateRates < ActiveRecord::Migration[5.0]
  def change
    create_table :rates do |t|
      t.references :rater, index: true, foreign_key: { to_table: :users }
      t.integer :value, null: false
      t.belongs_to :translation, index: true
      t.timestamps
    end
  end
end
