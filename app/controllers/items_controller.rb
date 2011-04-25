class ItemsController < ApplicationController

  before_filter :authenticate_user!

  def edit
    @store = current_user.stores.find(params[:store_id])
    @item = @store.items.find(params[:id])
  end

  def create
    @store = current_user.stores.find(params[:store_id])
    @item = Item.new(params[:item])
    @item.store_id = @store.id
    @item.number_needed = 1
    
    if !params[:item][:name] || params[:item][:name].blank?
      redirect_to(store_path(@store.id))
      return
    end
    
    existing_item = @store.items.find_by_name(params[:item][:name])
    if existing_item 
      existing_item.number_needed += 1
      existing_item.save
      redirect_to(store_path(@store.id), :notice => "#{existing_item.name} number needed was incremented.")
      return
    end

    if @item.save
      subnotice = render_to_string :partial => "subnotice_create"
      flash[:notice] = ("#{@item.name} was added to your list." + subnotice).html_safe
      redirect_to store_path(@store.id)
    else
      render :action => "new"
    end
  end

  def update
    @store = current_user.stores.find(params[:store_id])
    @item = @store.items.find(params[:id])

    if @item.update_attributes(params[:item])
      redirect_to(store_path(@store.id), :notice => "#{@item.name} was updated.")
    else
      render :action => "edit"
    end
  end

  def destroy
    @store = current_user.stores.find(params[:store_id])
    @item = @store.items.find(params[:id])

    @item.destroy

    redirect_to(store_path(@store.id), :notice => "#{@item.name} was deleted.")
  end

  def mark_purchased
    @store = current_user.stores.find(params[:store_id])
    @item = @store.items.find(params[:id])
    
    original_number_needed = @item.number_needed
    @item.popularity += @item.number_needed
    @item.number_needed = 0
    @item.save!
    
    subnotice = render_to_string :partial => "subnotice_purchase"
    flash[:notice] = ("#{@item.name} was marked purchased. <a href=\"#{url_for(:action => 'undo_purchase', :number_needed => original_number_needed)}\">undo</a>" +
      subnotice).html_safe
    redirect_to store_path(@store.id)
  end

  def undo_purchase
    @store = current_user.stores.find(params[:store_id])
    @item = @store.items.find(params[:id])
    
    print "undoing purchase of #{@item.name}. number_needed = #{params[:number_needed]}\n\n"

    @item.popularity -= params[:number_needed].to_i
    @item.number_needed = params[:number_needed].to_i
    @item.save!

    redirect_to store_path(@store.id)
  end

  def add_needed
    @store = current_user.stores.find(params[:store_id])
    @item = @store.items.find(params[:id])

    @item.number_needed += 1
    @item.save!
    
   flash[:notice] = "#{@item.name} number needed was incremented."

   redirect_to store_path(@store.id)
  end

  def subtract_needed
     @store = current_user.stores.find(params[:store_id])
     @item = @store.items.find(params[:id])

     @item.number_needed -= 1 if @item.number_needed > 0
     @item.save!

    flash[:notice] = "#{@item.name} number needed was decremented."

    redirect_to store_path(@store.id)
  end

end
