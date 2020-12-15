class CreateCalendars < ActiveRecord::Migration[6.0]
  def change
    create_table :calendars do |t|
      t.date :date, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
    add_index :calendars, [:user_id, :date], unique: true
  end
end
