require 'test_helper'

class AlumnisControllerTest < ActionController::TestCase
  setup do
    @alumni = alumnis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:alumnis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create alumni" do
    assert_difference('Alumni.count') do
      post :create, alumni: { first_name: @alumni.first_name, last_name: @alumni.last_name, tsl_key: @alumni.tsl_key }
    end

    assert_redirected_to alumni_path(assigns(:alumni))
  end

  test "should show alumni" do
    get :show, id: @alumni
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @alumni
    assert_response :success
  end

  test "should update alumni" do
    patch :update, id: @alumni, alumni: { first_name: @alumni.first_name, last_name: @alumni.last_name, tsl_key: @alumni.tsl_key }
    assert_redirected_to alumni_path(assigns(:alumni))
  end

  test "should destroy alumni" do
    assert_difference('Alumni.count', -1) do
      delete :destroy, id: @alumni
    end

    assert_redirected_to alumnis_path
  end
end
