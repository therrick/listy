require 'test_helper'

class AislesControllerTest < ActionController::TestCase
  include Devise::TestHelpers  

  setup do
    @aisle = aisles(:one)
    @store = stores(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get :index, :store_id => @store.id
    assert_response :success
    assert_not_nil assigns(:aisles)
  end

  test "should create aisle" do
    assert_difference('Aisle.count') do
      post :create, :aisle => @aisle.attributes, :store_id => @store.id
    end

    assert_redirected_to store_aisles_path(@store.id)
  end

  test "should get edit" do
    get :edit, :id => @aisle.to_param, :store_id => @store.id
    assert_response :success
  end

  test "should update aisle" do
    put :update, :id => @aisle.to_param, :aisle => @aisle.attributes, :store_id => @store.to_param
    assert_redirected_to store_aisles_path(@store.id)
  end

  test "should destroy aisle" do
    assert_difference('Aisle.count', -1) do
      delete :destroy, :id => @aisle.to_param, :store_id => @store.to_param
    end

    assert_redirected_to store_aisles_path(@store.id)
  end
end
