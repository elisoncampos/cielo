require 'cielo/client'
require 'cielo/merchant'

module Cielo
  
  def self.client(merchant, environment = nil)
    Client.new(merchant, environment)
  end
  
  def self.merchant(merchant_id, merchant_key)
    Merchant.new(merchant_id, merchant_key)
  end
end
