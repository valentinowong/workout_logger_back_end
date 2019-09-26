require 'test_helper'

class Api::V1::WorkoutsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_workouts_index_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_workouts_create_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_workouts_show_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_workouts_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_v1_workouts_destroy_url
    assert_response :success
  end

end
