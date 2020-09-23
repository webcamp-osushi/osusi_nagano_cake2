class ApplicationController < ActionController::Base
	def after_sign_in_path_for(resource)
    if resource == :admin
      admins_root_path
    elsif resource == :customer
    customer_path
    end
  end
  def after_sign_out_path_for(resource)
    if resource == :admin
      new_admin_session_path
    elsif resource == :customer
    new_customer_session_path
    end
  end 
end