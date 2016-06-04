require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get favourites" do
    get :favourites
    assert_response :success
  end

end
