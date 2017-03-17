module Cielo
  module Response
    class Token
      attr_accessor :response, :token
      
      def initialize(response)
        @response = response
        @token = @response['CardToken']
      end
    end
  end
end
