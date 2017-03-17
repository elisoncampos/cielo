require 'cielo/request/api_request'

module Cielo
  module Request
    class ApiToken < ApiRequest
      attr_accessor :environment
      private :environment
      
      def initialize(merchant, environment)
        super(merchant)
        @environment = environment
      end
      
      def generate_token(credit_card_params)
        uri = URI.parse([@environment.api, '1/card'].join(''))
        Cielo::Response::Token.new(send_request('POST', uri, credit_card_params))
      end
    end
  end
end