module Cielo
  class Client
    attr_accessor :merchant, :environment
    private :merchant, :environment

    # Create an instance of API client by choosing the environment where the
    # requests will be send
    #
    # @param merchant [Merchant] The merchant credentials
    # @param environment [Environment] The environment
    def initialize(merchant, environment = nil)
      environment ||= Environment.production
  
      @merchant = merchant
      @environment = environment
    end
    
    # Retorna o token de um cartão de crédito
    def tokenize_card(credit_card_params)
      Cielo::Request::ApiToken.new(merchant, environment).generate_token(credit_card_params)
    end
    
  end
end
