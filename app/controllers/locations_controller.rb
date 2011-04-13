class LocationsController < ApplicationController

  before_filter :authenticate_user!

    def index
      @store = current_user.stores.find(params[:store_id])
      @locations = @store.locations
    end

    def new
      @store = current_user.stores.find(params[:store_id])
      @location = Location.new
    end

    def edit
      @store = current_user.stores.find(params[:store_id])
      @location = @store.locations.find(params[:id])
    end

    def create
      @store = current_user.stores.find(params[:store_id])
      @location = Location.new(params[:location])
      @location.store_id = @store.id

      if @location.save
        redirect_to(store_locations_url(@store_id), :notice => 'Location was successfully created.')
      else
        render :action => "new"
      end
    end
    
    def sort
      @store = current_user.stores.find(params[:store_id])
      locations = @store.locations
      locations.each do |location|
        location.position = params['location'].index(location.id.to_s) + 1
        location.save
      end
      render :nothing => true
    end

    def update
      @store = current_user.stores.find(params[:store_id])
      @location = @store.locations.find(params[:id])

      if @location.update_attributes(params[:location])
        redirect_to(store_locations_url(@store_id), :notice => 'Location was successfully updated.')
      else
        render :action => "edit"
      end
    end

    def destroy
      @store = current_user.stores.find(params[:store_id])
      @location = @store.locations.find(params[:id])
      @location.destroy

      redirect_to(store_locations_url(@store_id))
    end
  end
