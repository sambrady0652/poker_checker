require "test_helper"

class HandsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get hands_show_url
    assert_response :success
  end

  test "should get new" do
    get hands_new_url
    assert_response :success
  end
end
