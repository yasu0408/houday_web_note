class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.string :condition, null: false
      t.string :humor, null: false
      t.float :temp, null: false
      t.text :message
      t.timestamps
    end
    add_index :notes, [:user_id, :date], unique: true
  end
end
