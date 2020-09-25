class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

<<<<<<< HEAD

 enum is_deleted: {Available: false, Invalid: true}
=======
  has_many :orders, dependent: :destroy
  has_many :carts, dependent: :destroy
  
  enum is_deleted: {Available: false, Invalid: true}
>>>>>>> f669856bd484038db90f157e7a664e43466def02
    def active_for_authentication?
        super && (self.is_deleted === "Available")
 end
end
    

module Bookers2Debug
  class Application < Rails::Application
    config.load_defaults 5.2
    config.i18n.default_locale = :ja 
  end
end