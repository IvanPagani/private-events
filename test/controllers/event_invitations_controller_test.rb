require "test_helper"

class EventInvitationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get event_invitations_new_url
    assert_response :success
  end

  test "should get create" do
    get event_invitations_create_url
    assert_response :success
  end

  test "should get update" do
    get event_invitations_update_url
    assert_response :success
  end
end
