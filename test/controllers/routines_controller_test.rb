require 'test_helper'

class RoutinesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get routines_index_url
    assert_response :success
  end

  test "should get create" do
    get routines_create_url
    assert_response :success
  end

end
