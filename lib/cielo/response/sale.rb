module Cielo
  module Response
    class Sale

      attr_reader :response,
                  :payment

      def initialize(response)
        @response = response
        @payment = Cielo::Response::Payment.new response['Payment']
      end

    end
  end
end
