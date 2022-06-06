class AddNameToScore < ActiveRecord::Migration[6.1]
  def change
    add_column :scores, :name, :string
    add_column :scores, :lastname, :string
    add_column :scores, :rg, :string
    add_column :scores, :cpf, :string
    add_column :scores, :dap, :string
    add_column :scores, :experience, :integer
  end
end
