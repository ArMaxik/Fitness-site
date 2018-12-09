require 'test_helper'

class ExercisesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get exercises_create_url
    assert_response :success
  end

  test "should get delete" do
    get exercises_delete_url
    assert_response :success
  end

  test "should get show" do
    get exercises_show_url
    assert_response :success
  end

end
