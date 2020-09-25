# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController


def after_sign_in_path_for(resource)
  products_path
end 

def after_sign_out_path_for(resource)
  products_path
end 



protected

  def reject_user
    customer = Customer.find_by(email: params[:user][:email].downcase)
    if customer
      if (customer.valid_password?(params[:user][:password]) && (customer.active_for_authentication? == false))
        redirect_to new_customer_session_path
      end
    end
  end
end