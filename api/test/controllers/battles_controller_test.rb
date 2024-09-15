require "test_helper"

class BattlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get battles_index_url
    assert_response :success
  end

  test "should get show" do
    get battles_show_url
    assert_response :success
  end
end
