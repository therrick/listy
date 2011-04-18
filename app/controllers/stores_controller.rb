class StoresController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @stores = Store.where("user_id = ? and hidden = false", current_user.id).order("name")
    @store = Store.new # for 'new' form at top of page
  end
  
  def show
    @store = current_user.stores.find(params[:id])
    @item = Item.new() # for 'new' form at top of page
    
    @list_items = Item.scoped
    @list_items = @list_items.search(params[:search])
    @list_items = @list_items.joins("LEFT OUTER JOIN aisles on items.aisle_id=aisles.id")
    @list_items = @list_items.where("items.store_id = ? AND items.number_needed > 0", @store.id)
    @list_items = @list_items.order("aisles.position, items.name")

    @other_items = Item.scoped
    @other_items = @other_items.search(params[:search])
    @other_items = @other_items.joins("LEFT OUTER JOIN aisles on items.aisle_id=aisles.id")
    @other_items = @other_items.where("items.store_id = ? AND items.number_needed = 0", @store.id)
      
    if params[:sort] == "pop"
      @other_items = @other_items.order("items.popularity DESC")
    else
      @other_items = @other_items.order("items.name")
    end
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
    # hide instead of @store.destroy
    @store.hidden = true
    @store.save
  
    redirect_to(stores_url)
  end
  
  def mark_all_purchased
    @store = current_user.stores.find(params[:id])

    list_items = @store.items.where("number_needed > 0")
    list_items.each do |item|
      item.popularity += item.number_needed
      item.number_needed = 0
      item.save!
    end
    
    redirect_to store_url(@store.id)
  end
end
