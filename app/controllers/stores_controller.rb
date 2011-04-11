class StoresController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @stores = Store.find_all_by_user_id(current_user.id)
  end
  
  def show
    @store = current_user.stores.find(params[:id])
    @item = Item.new() # for 'new' form at top of page
    
    @list_items = Item.joins("LEFT OUTER JOIN locations on items.location_id=locations.id")
      .where("items.store_id = ? AND items.number_needed > 0", @store.id)
      .order("locations.sort, items.name")
    @other_items = Item.joins("LEFT OUTER JOIN locations on items.location_id=locations.id")
      .where("items.store_id = ? AND items.number_needed = 0", @store.id)
      .order("locations.sort, items.name")
  
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
