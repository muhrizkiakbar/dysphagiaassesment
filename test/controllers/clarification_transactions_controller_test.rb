require 'test_helper'

class ClarificationTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clarification_transaction = clarification_transactions(:one)
  end

  test "should get index" do
    get clarification_transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_clarification_transaction_url
    assert_response :success
  end

  test "should create clarification_transaction" do
    assert_difference('ClarificationTransaction.count') do
      post clarification_transactions_url, params: { clarification_transaction: { clarification: @clarification_transaction.clarification, transaction_id: @clarification_transaction.transaction_id } }
    end

    assert_redirected_to clarification_transaction_url(ClarificationTransaction.last)
  end

  test "should show clarification_transaction" do
    get clarification_transaction_url(@clarification_transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_clarification_transaction_url(@clarification_transaction)
    assert_response :success
  end

  test "should update clarification_transaction" do
    patch clarification_transaction_url(@clarification_transaction), params: { clarification_transaction: { clarification: @clarification_transaction.clarification, transaction_id: @clarification_transaction.transaction_id } }
    assert_redirected_to clarification_transaction_url(@clarification_transaction)
  end

  test "should destroy clarification_transaction" do
    assert_difference('ClarificationTransaction.count', -1) do
      delete clarification_transaction_url(@clarification_transaction)
    end

    assert_redirected_to clarification_transactions_url
  end
end
