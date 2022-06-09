class AddRiskToScore < ActiveRecord::Migration[6.1]
  def change
    add_column :scores, :risk, :string
  end
end
