require "test_helper"

class OrderDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get order_details_update_url
    assert_response :success
  end
end
