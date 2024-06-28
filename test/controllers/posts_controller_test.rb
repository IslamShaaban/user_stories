require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get Reviews" do
    get posts_Reviews_url
    assert_response :success
  end
end
