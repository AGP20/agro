class CreateScores < ActiveRecord::Migration[6.1]
  def change
    create_table :scores do |t|
      t.float :annual_income
      t.string :crop
      t.integer :ha
      t.string :garantia
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
