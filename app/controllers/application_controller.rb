class ApplicationController < ActionController::Base



	def after_sign_in_path_for(resource)
    # customer_path(resource) エラーが出るため、コメントアウトしました（上田）
    customers_products_path
    end

    before_action :configure_permitted_parameters, if: :devise_controller?
    
    protected


    def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :postal_cord, :telephone_number])
   end
end