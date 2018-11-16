class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.text :content, null: false
      t.integer :track_id, null: false
      t.timestamps
    end
  end
end
