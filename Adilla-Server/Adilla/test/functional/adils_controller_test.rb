require 'test_helper'

class AdilsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:adils)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create adil" do
    assert_difference('Adil.count') do
      post :create, :adil => { }
    end

    assert_redirected_to adil_path(assigns(:adil))
  end

  test "should show adil" do
    get :show, :id => adils(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => adils(:one).to_param
    assert_response :success
  end

  test "should update adil" do
    put :update, :id => adils(:one).to_param, :adil => { }
    assert_redirected_to adil_path(assigns(:adil))
  end

  test "should destroy adil" do
    assert_difference('Adil.count', -1) do
      delete :destroy, :id => adils(:one).to_param
    end

    assert_redirected_to adils_path
  end
end
