require 'cielo/environment'
require 'cielo/client'
require 'cielo/merchant'

require 'cielo/response/token'
require 'cielo/response/sale'
require 'cielo/response/payment'

require 'cielo/request/api_sale'
require 'cielo/request/api_token'

module Cielo
  
  class PaymentType
    CREDITCARD = 'CreditCard'
    DEBITCARD = 'DebitCard'
    ELECTRONIC_TRANSFER = 'ElectronicTransfer'
    BOLETO = 'Boleto'
  end
  
  class ProviderType
    BRADESCO = 'Bradesco'
    BANCO_DO_BRASIL = 'BancoDoBrasil'
    SIMULADO = 'Simulado'
  end
  
  def self.client(merchant, environment = nil)
    Client.new(merchant, environment)
  end
  
  def self.merchant(merchant_id, merchant_key)
    Merchant.new(merchant_id, merchant_key)
  end
end
