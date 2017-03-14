module Cielo
  module Request
    class ApiToken
      attr_accessor :environment
      private :environment
      
      def initialize(merchant, environment)
        super(merchant)
        @environment = environment
      end
      
      def generate_token(credit_card_params)
        uri = URI.parse([@environment.api, '1/card'].join(''))
        send_request('POST', uri, credit_card_params)
      end
    end
  end
end