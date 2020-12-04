class CreateReceptions < ActiveRecord::Migration[6.0]
  def change
    create_table :receptions do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date, null: false
      t.time :arrive, null: false
      t.time :leave
      t.timestamps
    end
  end
end
