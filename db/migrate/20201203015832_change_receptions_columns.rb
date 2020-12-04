class ChangeReceptionsColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :receptions, :arrive, :time
    remove_column :receptions, :leave, :time
    add_column :receptions, :arrive, :datetime
    add_column :receptions, :leave, :datetime
  end
end
