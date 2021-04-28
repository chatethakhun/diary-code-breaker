class RemoveIncomeNoteFromExpense < ActiveRecord::Migration[6.0]
  def change
    remove_column :expenses, :income_note, :string
    remove_column :expenses, :outcome_note, :string
  end
end
