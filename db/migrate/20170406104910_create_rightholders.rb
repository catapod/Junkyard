class CreateRightholders < ActiveRecord::Migration[5.0]
  def change
    create_table :rightholders do |t|
      t.string :caption_original, null: false
      t.string :caption_translated, null: true
      t.string :short_original, null: false
      t.string :short_translated, null: true
      t.string :link, null: true
      t.string :icon, null: true
    end
  end
end
