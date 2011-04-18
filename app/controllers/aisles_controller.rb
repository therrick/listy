class AislesController < ApplicationController

  before_filter :authenticate_user!

    def index
      @store = current_user.stores.find(params[:store_id])
      @aisles = @store.aisles
      @aisle = Aisle.new # for add-location form
    end

    def new
      @store = current_user.stores.find(params[:store_id])
      @aisle = Aisle.new
    end

    def edit
      @store = current_user.stores.find(params[:store_id])
      @aisle = @store.aisles.find(params[:id])
    end

    def create
      @store = current_user.stores.find(params[:store_id])
      @aisle = Aisle.new(params[:aisle])
      @aisle.store_id = @store.id

      if @aisle.save
        redirect_to(store_aisles_url(@store_id), :notice => 'Aisle was successfully created.')
      else
        render :action => "new"
      end
    end
    
    def move_up
      @store = current_user.stores.find(params[:store_id])
      aisles = @store.aisles
      @aisle = aisles.find(params[:id])
      original_position = @aisle.position
      if original_position > 1
        @aisle.position -= 1
        @aisle.save
        aisles.each do |aisle|
          aisle.position += 1 if aisle != @aisle &&
            aisle.position >= @aisle.position &&
            aisle.position <= original_position
          aisle.save
        end
      end
      redirect_to(store_aisles_url(@store_id))
    end
    
    def sort
      @store = current_user.stores.find(params[:store_id])
      aisles = @store.aisles
      aisles.each do |aisle|
        aisle.position = params['aisle'].index(aisle.id.to_s) + 1
        aisle.save
      end
      render :nothing => true
    end

    def update
      @store = current_user.stores.find(params[:store_id])
      @aisle = @store.aisles.find(params[:id])

      if @aisle.update_attributes(params[:aisle])
        redirect_to(store_aisles_url(@store_id), :notice => 'Aisle was successfully updated.')
      else
        render :action => "edit"
      end
    end

    def destroy
      @store = current_user.stores.find(params[:store_id])
      @aisle = @store.aisles.find(params[:id])
      @aisle.destroy

      redirect_to(store_aisles_url(@store_id))
    end
  end
