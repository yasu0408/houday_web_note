class RemoveDateFromReceptions < ActiveRecord::Migration[6.0]
  def change
    remove_column :receptions, :date, :date
  end
end
