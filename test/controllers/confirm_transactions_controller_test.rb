require 'test_helper'

class ConfirmTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @confirm_transaction = confirm_transactions(:one)
  end

  test "should get index" do
    get confirm_transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_confirm_transaction_url
    assert_response :success
  end

  test "should create confirm_transaction" do
    assert_difference('ConfirmTransaction.count') do
      post confirm_transactions_url, params: { confirm_transaction: { status: @confirm_transaction.status, transaction_id: @confirm_transaction.transaction_id } }
    end

    assert_redirected_to confirm_transaction_url(ConfirmTransaction.last)
  end

  test "should show confirm_transaction" do
    get confirm_transaction_url(@confirm_transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_confirm_transaction_url(@confirm_transaction)
    assert_response :success
  end

  test "should update confirm_transaction" do
    patch confirm_transaction_url(@confirm_transaction), params: { confirm_transaction: { status: @confirm_transaction.status, transaction_id: @confirm_transaction.transaction_id } }
    assert_redirected_to confirm_transaction_url(@confirm_transaction)
  end

  test "should destroy confirm_transaction" do
    assert_difference('ConfirmTransaction.count', -1) do
      delete confirm_transaction_url(@confirm_transaction)
    end

    assert_redirected_to confirm_transactions_url
  end
end
