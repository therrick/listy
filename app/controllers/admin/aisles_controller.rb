class Admin::AislesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :verify_admin!

  # GET /aisles
  # GET /aisles.xml
  def index
    @aisles = Aisle.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @aisles }
    end
  end

  # GET /aisles/1
  # GET /aisles/1.xml
  def show
    @aisle = Aisle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @aisle }
    end
  end

  # GET /aisles/new
  # GET /aisles/new.xml
  def new
    @aisle = Aisle.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @aisle }
    end
  end

  # GET /aisles/1/edit
  def edit
    @aisle = Aisle.find(params[:id])
  end

  # POST /aisles
  # POST /aisles.xml
  def create
    @aisle = Aisle.new(params[:aisle])

    respond_to do |format|
      if @aisle.save
        format.html { redirect_to(@aisle, :notice => 'Aisle was successfully created.') }
        format.xml  { render :xml => @aisle, :status => :created, :location => @aisle }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @aisle.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /aisles/1
  # PUT /aisles/1.xml
  def update
    @aisle = Aisle.find(params[:id])

    respond_to do |format|
      if @aisle.update_attributes(params[:aisle])
        format.html { redirect_to(@aisle, :notice => 'Aisle was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @aisle.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /aisles/1
  # DELETE /aisles/1.xml
  def destroy
    @aisle = Aisle.find(params[:id])
    @aisle.destroy

    respond_to do |format|
      format.html { redirect_to(aisles_url) }
      format.xml  { head :ok }
    end
  end
end
