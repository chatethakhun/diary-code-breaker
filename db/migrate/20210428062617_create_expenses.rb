class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.integer :income
      t.string :income_note
      t.integer :outcome
      t.string :outcome_note

      t.timestamps
    end
  end
end
