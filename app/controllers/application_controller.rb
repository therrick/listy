class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def verify_admin!
    return true if current_user.admin?
    head :unauthorized
    return false
  end
end
