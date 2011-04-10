class StoresController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @stores = Store.find_all_by_user_id(current_user.id)
  end
  
  def show
    @store = current_user.stores.find(params[:id])
    @list_items = Item.where("store_id = ? AND number_needed > 0", @store.id)
    @other_items = Item.where("store_id = ? AND number_needed = 0", @store.id)
  
  end
  
  def new
    @store = Store.new
  end
  
  def edit
    @store = current_user.stores.find(params[:id])
  end
  
  def create
    @store = Store.new(params[:store])
    @store.user_id = current_user.id
  
    if @store.save
      redirect_to(stores_url, :notice => 'store was successfully created.')
    else
      render :action => "new"
    end
  end
  
  def update
    @store = current_user.stores.find(params[:id])
  
    if @store.update_attributes(params[:store])
      redirect_to(stores_url, :notice => 'store was successfully updated.')
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @store = current_user.stores.find(params[:id])
    @store.destroy
  
    redirect_to(stores_url)
  end
end
