require "application_system_test_case"

class ConfirmTransactionsTest < ApplicationSystemTestCase
  setup do
    @confirm_transaction = confirm_transactions(:one)
  end

  test "visiting the index" do
    visit confirm_transactions_url
    assert_selector "h1", text: "Confirm Transactions"
  end

  test "creating a Confirm transaction" do
    visit confirm_transactions_url
    click_on "New Confirm Transaction"

    fill_in "Status", with: @confirm_transaction.status
    fill_in "Transaction", with: @confirm_transaction.transaction_id
    click_on "Create Confirm transaction"

    assert_text "Confirm transaction was successfully created"
    click_on "Back"
  end

  test "updating a Confirm transaction" do
    visit confirm_transactions_url
    click_on "Edit", match: :first

    fill_in "Status", with: @confirm_transaction.status
    fill_in "Transaction", with: @confirm_transaction.transaction_id
    click_on "Update Confirm transaction"

    assert_text "Confirm transaction was successfully updated"
    click_on "Back"
  end

  test "destroying a Confirm transaction" do
    visit confirm_transactions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Confirm transaction was successfully destroyed"
  end
end
