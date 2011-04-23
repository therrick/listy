require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  include Devise::TestHelpers  
  
  setup do
    @item = items(:one)
    @store = stores(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should create item" do
    item = Item.new(:name => "just testing", :store_id => @store.id)
    assert_difference('Item.count') do
      post :create, :item => item.attributes, :store_id => @store.id
    end

    assert_redirected_to store_path(@store.id)
  end

  test "should get edit" do
    get :edit, :id => @item.to_param, :store_id => @store.id
    assert_response :success
  end

  test "should update item" do
    put :update, :id => @item.to_param, :item => @item.attributes, :store_id => @store.id
    assert_redirected_to store_path(@item.store.id)
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete :destroy, :id => @item.to_param, :store_id => @item.store.to_param
    end

    assert_redirected_to store_path(@item.store.id)
  end
end
