$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'cielo/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'cielo'
  s.version     = Cielo30::VERSION
  s.authors     = ['Elison']
  s.email       = ['elison.campos@gmail.com']
  s.homepage    = 'https://github.com/elisoncampos/cielo'
  s.summary     = 'Implementação da versão 3.0 do Web Service da Cielo para projetos Rails'
  s.description = s.summary
  s.license     = 'MIT'

  s.files = `git ls-files`.split('\n')

  s.add_dependency 'rails', '~> 5.0.1'
  
end
