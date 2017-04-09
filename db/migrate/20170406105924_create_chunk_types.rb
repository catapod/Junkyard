class CreateChunkTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :chunk_types do |t|
      t.string :name, null: false
      t.string :display_name, null: false
    end
  end
end
