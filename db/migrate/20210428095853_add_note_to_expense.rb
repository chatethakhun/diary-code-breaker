class AddNoteToExpense < ActiveRecord::Migration[6.0]
  def change
    add_column :expenses, :note, :text
  end
end
