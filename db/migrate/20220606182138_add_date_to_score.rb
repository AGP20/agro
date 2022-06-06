class AddDateToScore < ActiveRecord::Migration[6.1]
  def change
    add_column :scores, :iniplant, :date
    add_column :scores, :endplant, :date
  end
end
