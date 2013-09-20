require 'test_helper'

class TeaClubsControllerTest < ActionController::TestCase
  setup do
    @tea_club = tea_clubs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tea_clubs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tea_club" do
    assert_difference('TeaClub.count') do
      post :create, tea_club: { city: @tea_club.city, founded: @tea_club.founded, name: @tea_club.name }
    end

    assert_redirected_to tea_club_path(assigns(:tea_club))
  end

  test "should show tea_club" do
    get :show, id: @tea_club
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tea_club
    assert_response :success
  end

  test "should update tea_club" do
    patch :update, id: @tea_club, tea_club: { city: @tea_club.city, founded: @tea_club.founded, name: @tea_club.name }
    assert_redirected_to tea_club_path(assigns(:tea_club))
  end

  test "should destroy tea_club" do
    assert_difference('TeaClub.count', -1) do
      delete :destroy, id: @tea_club
    end

    assert_redirected_to tea_clubs_path
  end
end
