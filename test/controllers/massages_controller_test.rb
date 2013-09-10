require 'test_helper'

class MassagesControllerTest < ActionController::TestCase
  setup do
    @massage = massages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:massages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create massage" do
    assert_difference('Massage.count') do
      post :create, massage: { massage: @massage.massage, user1_id: @massage.user1_id, user2_id: @massage.user2_id }
    end

    assert_redirected_to massage_path(assigns(:massage))
  end

  test "should show massage" do
    get :show, id: @massage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @massage
    assert_response :success
  end

  test "should update massage" do
    patch :update, id: @massage, massage: { massage: @massage.massage, user1_id: @massage.user1_id, user2_id: @massage.user2_id }
    assert_redirected_to massage_path(assigns(:massage))
  end

  test "should destroy massage" do
    assert_difference('Massage.count', -1) do
      delete :destroy, id: @massage
    end

    assert_redirected_to massages_path
  end
end
