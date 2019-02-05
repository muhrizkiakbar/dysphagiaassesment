require "application_system_test_case"

class ClarificationTransactionsTest < ApplicationSystemTestCase
  setup do
    @clarification_transaction = clarification_transactions(:one)
  end

  test "visiting the index" do
    visit clarification_transactions_url
    assert_selector "h1", text: "Clarification Transactions"
  end

  test "creating a Clarification transaction" do
    visit clarification_transactions_url
    click_on "New Clarification Transaction"

    fill_in "Clarification", with: @clarification_transaction.clarification
    fill_in "Transaction", with: @clarification_transaction.transaction_id
    click_on "Create Clarification transaction"

    assert_text "Clarification transaction was successfully created"
    click_on "Back"
  end

  test "updating a Clarification transaction" do
    visit clarification_transactions_url
    click_on "Edit", match: :first

    fill_in "Clarification", with: @clarification_transaction.clarification
    fill_in "Transaction", with: @clarification_transaction.transaction_id
    click_on "Update Clarification transaction"

    assert_text "Clarification transaction was successfully updated"
    click_on "Back"
  end

  test "destroying a Clarification transaction" do
    visit clarification_transactions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Clarification transaction was successfully destroyed"
  end
end
