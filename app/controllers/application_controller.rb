class ApplicationController < ActionController::Base
<<<<<<< HEAD
=======

>>>>>>> f669856bd484038db90f157e7a664e43466def02
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
<<<<<<< HEAD
  end 
=======
  end

  # devise ストロングパラメータ
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :postal_cord, :telephone_number])
  end

>>>>>>> f669856bd484038db90f157e7a664e43466def02
end