require "application_system_test_case"

class ExpensesTest < ApplicationSystemTestCase
  setup do
    @expense = expenses(:one)
  end

  test "visiting the index" do
    visit expenses_url
    assert_selector "h1", text: "Expenses"
  end

  test "creating a Expense" do
    visit expenses_url
    click_on "New Expense"

    fill_in "Income", with: @expense.income
    fill_in "Income note", with: @expense.income_note
    fill_in "Outcome", with: @expense.outcome
    fill_in "Outcome note", with: @expense.outcome_note
    click_on "Create Expense"

    assert_text "Expense was successfully created"
    click_on "Back"
  end

  test "updating a Expense" do
    visit expenses_url
    click_on "Edit", match: :first

    fill_in "Income", with: @expense.income
    fill_in "Income note", with: @expense.income_note
    fill_in "Outcome", with: @expense.outcome
    fill_in "Outcome note", with: @expense.outcome_note
    click_on "Update Expense"

    assert_text "Expense was successfully updated"
    click_on "Back"
  end

  test "destroying a Expense" do
    visit expenses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Expense was successfully destroyed"
  end
end
