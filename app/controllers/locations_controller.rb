class Admin::LocationsController < ApplicationController

  before_filter :authenticate_user!

end
