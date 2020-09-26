class Customers::Base < ApplicationController
   before_action :authenticate_admin!
end