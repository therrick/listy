require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  include Devise::TestHelpers  
  
  setup do
    @item = items(:one)
    assert_not_nil @item
    @user = users(:one)
    assert_not_nil @user
    sign_in @user
    @store = @user.stores.first
    assert_not_nil @store
  end

  test "should get index" do
    get :index, :store_id => @store.id
    assert_response :success
    assert_not_nil assigns(:items)
  end

  test "should get new" do
    get :new, :store_id => @store.id
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post :create, :item => @item.attributes, :store_id => @store.id
    end

    assert_redirected_to item_path(assigns(:item))
  end

  test "should show item" do
    get :show, :id => @item.to_param, :store_id => @store.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @item.to_param, :store_id => @store.id
    assert_response :success
  end

  test "should update item" do
    put :update, :id => @item.to_param, :item => @item.attributes, :store_id => @store.id
    assert_redirected_to item_path(assigns(:item))
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete :destroy, :id => @item.to_param, :store_id => @store.id
    end

    assert_redirected_to items_path
  end
end
