require "test_helper"

class PublicControllerTest < ActionDispatch::IntegrationTest
  test "should get items" do
    get public_items_url
    assert_response :success
  end
end
