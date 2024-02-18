require "test_helper"

class Public::PublicersControllerTest < ActionDispatch::IntegrationTest
  test "should get my_page" do
    get public_publicers_my_page_url
    assert_response :success
  end
end
