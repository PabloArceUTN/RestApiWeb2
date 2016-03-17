class Transfer < ActiveRecord::Base
  belongs_to :product_req
  belongs_to :product_offer
end
