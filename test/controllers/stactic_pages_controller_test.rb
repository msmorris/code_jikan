require 'test_helper'

class StacticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get shop" do
    get :shop
    assert_response :success
  end

end
