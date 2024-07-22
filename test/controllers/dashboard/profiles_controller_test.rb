require "test_helper"

class Dashboard::ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_profiles_index_url
    assert_response :success
  end
end
