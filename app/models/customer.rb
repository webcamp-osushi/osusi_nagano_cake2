class Customer < ApplicationRecord
  belongs_to :admin
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



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