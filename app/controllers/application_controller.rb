class ApplicationController < ActionController::Base



	def after_sign_in_path_for(resource)
    # customer_path(resource) エラーが出るため、コメントアウトしました（上田）
    customers_products_path
    end
end