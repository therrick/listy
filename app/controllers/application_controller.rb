class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :strip_params
  
  def verify_admin!
    return true if current_user.admin?
    head :unauthorized
    return false
  end
  
  private
  def strip_params
    strip_hash_values(params)
  end

  def strip_hash_values(hash)
    hash.each do |k, v|
      case v
      when String
        v.strip!
      when Array
        v.each {|vv| vv.strip!}
      when Hash
        strip_hash_values(v)
      end
    end
  end
  
end
