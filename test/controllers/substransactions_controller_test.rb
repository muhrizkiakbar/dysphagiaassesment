require 'test_helper'

class SubstransactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get substransactions_new_url
    assert_response :success
  end

  test "should get create" do
    get substransactions_create_url
    assert_response :success
  end

end
