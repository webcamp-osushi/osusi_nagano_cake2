class ApplicationController < ActionController::Base

	def after_sign_in_path_for(resource)
    if resource.class == Admin
      admins_root_path
    elsif resource.class == Customer
      customer_path
    end
  end
  
  def after_sign_out_path_for(resource)
    if resource == :admin
      new_admin_session_path
    elsif resource == :customer
      root_path  
    end
  end 

  # devise ストロングパラメータ
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :postal_cord, :telephone_number])
  end

end