# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController





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