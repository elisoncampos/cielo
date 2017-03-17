# Cielo
Implementação simplificada da API 3.0 para projetos Rails. **Não recomendo utilizarem para produção a não ser que entendam 
como as requisições API da Cielo funcionam**. A gem trata o minimo dos retornos e muitos métodos podem não estar implementados

## Funcionalidades

* [x] Transações usando cartão de crédito
* [x] Tokenização de cartões
* [x] Cancelamento de transações

## Instalação

A gem não está no RubyGems e até eu implementar mais funcionalidades, não vou publicar, então instale:

```ruby
gem 'cielo', github: 'elisoncampos/cielo'
```

E ai execute:
```bash
$ bundle
```

## Utilizando o SDK

### Criando Transação

_(TBD)_

### Cancelando Transação

_(TBD)_

### Criando um token para o cartão

```ruby
 merchant = Cielo.merchant('MERCHANT-ID', 'MERCHANT-KEY')
 api = Cielo.client(merchant, Cielo::API30::Environment::sandbox)
 
 credit_card_params = {
    CustomerName: 'Comprador Teste Cielo',
    CardNumber: '4532117080573700',
    Holder: 'Comprador T Cielo',
    ExpirationDate: '12/2030',
    Brand: 'Visa'
 }
 token_request = api.tokenize_card(credit_card_params)
 token = token_request.token
```