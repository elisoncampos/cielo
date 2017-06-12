module Cielo
  module Response
    class Void
      attr_reader :response

      VOIDED = 10
      REFUNDED = 10

      def initialize(response)
        @response = response
        @status = response['Status']
        @return_code = response['ReturnCode']
        @return_message = response['ReturnMessage']
        @reason_code = response['ReasonCode']
        @reason_message = response['ReasonMessage']
      end

      def success?
        [VOIDED, REFUNDED].include? @status
      end
    end
  end
end
