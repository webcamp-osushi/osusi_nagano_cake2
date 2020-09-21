class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



def customer_params
  params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :password, :address, :postal_cord, :telephone_number, :is_deleted,)
end


end
