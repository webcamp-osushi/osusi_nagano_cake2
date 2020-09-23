class Order < ApplicationRecord
  has_many :order_details
  enum status:{ 
    waiting: 0,
    confirm: 1,
    making: 2,
    preparing: 3,
    shipping: 4
  }, _prefix:true
  #waiting=入金待ち、confirm=入金確認、making=製作中、preparing=発送準備中、shipping=発送済み
end
