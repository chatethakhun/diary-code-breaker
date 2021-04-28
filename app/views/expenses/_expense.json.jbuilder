json.extract! expense, :id, :income, :income_note, :outcome, :outcome_note, :created_at, :updated_at
json.url expense_url(expense, format: :json)
