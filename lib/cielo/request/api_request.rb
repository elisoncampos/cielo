require 'json'
require 'net/http'
require 'cielo/request/api_error'

module Cielo
  module Request
    class ApiRequest
      attr_accessor :merchant
      private :merchant
      
      def initialize(merchant)
        @merchant = merchant
      end
      
      protected
      
      def send_request(method, uri, data=nil)
        headers = {
          'User-Agent' => 'CieloEcommerce/3.0 Ruby SDK',
          'RequestId' => SecureRandom.uuid,
          'MerchantId' => merchant.merchant_id,
          'MerchantKey' => merchant.merchant_key
        }
        
        if data.nil?
          headers['Content-Length'] = '0'
        else
          headers['Content-Type'] = 'application/json'
          body = data.to_json
        end
        
        client = Net::HTTP.new(uri.host, uri.port)
        client.use_ssl = true
        
        response = client.send_request(method, uri.path, body, headers)
        data = JSON.parse(response.body)
        raise ApiError.new(data.first['Code'], data.first['Message']) if response.code.to_i >= 400
        data
      end
      
    end
  end
end
