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
                  :transaction_id,
                  :status,
                  :return_code,
                  :return_message

      def initialize(response)
        @response = response
        @payment_id = response['PaymentId']
        @transaction_id =  response['Tid']
        @status = response['Status']
        @return_code = response['ReturnCode']
        @return_message = response['ReturnMessage']
      end

      def response_hash
        _ret = {}
        _ret[@response['ReturnCode']] = @response['ReturnMessage']
        _ret.deep_symbolize_keys
      end

      def success?
        [AUTHORIZED, PAYMENT_CONFIRMED, VOIDED, REFUNDED, PENDING, SCHEDULED].include? @status
      end

      def error_message
        "Erro: [#{@return_code}]: #{@return_message}"
      end

    end
  end
end
