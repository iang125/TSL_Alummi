require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { adress: @user.adress, email: @user.email, fb_id: @user.fb_id, github_id: @user.github_id, latitude: @user.latitude, longitude: @user.longitude, name: @user.name, password_digest: @user.password_digest, phone_number: @user.phone_number, twiter_id: @user.twiter_id }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { adress: @user.adress, email: @user.email, fb_id: @user.fb_id, github_id: @user.github_id, latitude: @user.latitude, longitude: @user.longitude, name: @user.name, password_digest: @user.password_digest, phone_number: @user.phone_number, twiter_id: @user.twiter_id }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
