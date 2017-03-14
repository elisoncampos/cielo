require 'cielo/request/api_request'

module Cielo
  module Request
    class SaleRequest < ApiRequest
      attr_accessor :environment,
                    :type,
                    :service_tax_amount,
                    :amount
      
      private :environment, :type
      
      def initialize(type, merchant, environment)
        super(merchant)
        @environment = environment
        @type = type
      end
      
      def create(sale)
        uri = URI.parse([@environment.api, '1/sales'].join(''))
        send_request('POST', uri, sale)
      end
      
      def query(payment_id)
        uri = URI.parse([@environment.api_query, "1/sales/#{payment_id}"].join(''))
        send_request('GET', uri)
      end
      
      def update(payment_id)
        uri = URI.parse([@environment.api, "1/sales/#{payment_id}"])
        params = {}
        params['amoun'] = amount if amount
        params['serviceTaxAmount'] = service_tax_amount if service_tax_amount
        uri.query = URI.encode_www_form params
        send_request('PUT', uri)
      end
    end
  end
end