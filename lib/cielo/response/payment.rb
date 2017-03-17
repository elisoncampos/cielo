module Cielo
  module Response
    class Payment
      
      # Código dos status de retorno da Cielo
      NOT_FINISHED      = 0
      AUTHORIZED        = 1
      PAYMENT_CONFIRMED = 2
      DENIED            = 3
      VOIDED            = 10
      REFUNDED          = 11
      PENDING           = 12
      ABORTED           = 13
      SCHEDULED         = 20
      
      attr_reader :response,
                  :payment_id,
                  :status
      
      def initialize(response)
        @response = response
        @payment_id = response['PaymentId']
        @status = response['Status']
      end

      def response_hash
        _ret = {}
        _ret[@response['ReturnCode']] = @response['ReturnMessage']
        _ret.deep_symbolize_keys
      end
      
      def success?
        [AUTHORIZED, PAYMENT_CONFIRMED, VOIDED, REFUNDED, PENDING, SCHEDULED].include? @status
      end
      
    end
  end
end
