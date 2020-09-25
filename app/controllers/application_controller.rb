class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.class == Admin
      admins_root_path
    elsif resource.class == Customer
      customer_path(current_customer)
    end
  end
  
  def after_sign_out_path_for(resource)
    if resource == :admin
      new_admin_session_path
    elsif resource == :customer
      root_path
    end
  end 
end