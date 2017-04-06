class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :nickname, null: false
      t.string :avatar, null: true
      t.timestamps
    end
  end
end
