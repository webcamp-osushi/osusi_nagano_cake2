class Admin < ApplicationRecord
<<<<<<< HEAD
=======
  
>>>>>>> f669856bd484038db90f157e7a664e43466def02
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
