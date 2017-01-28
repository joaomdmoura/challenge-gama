- Feature Name: Google Maps Integration
- Start Date: 2016-01-28

# Summary
[summary]: #summary

Adicionar um campo de texto no qual o usuário digite um endereço e seja redirecionado
para a mesma página porém com as informações daquele endereço providas pelo Google Maps

# Motivation
[motivation]: #motivation

A motivação é poder facilitar identificar informações sobre um endereço, como CEP e
outras.

# Detailed design
[design]: #detailed-design

O design deve ser simples, as requisições para o Google Maps podem ser feitas para
o seguinte endereço `http://maps.google.com/maps/api/geocode/json?address=#{endereco}`,
substituindo o `endereco` pela informação digitada pelo usuário.

Nesse caso a querystring não vai funcionar se tiver espaços, portanto substituir os
espaços pelo `+` isso pode ser feito usando um método chamado `gsub` que é acessível em
qualquer string `gsub(' ', '+')`. Por exemplo:

```ruby
string = "str ing"
string.gsub(' ', '+')
# => str+ing
```

Também é preciso escapar o endereço para evitar eventuais caracteres problemáticos:

`URI.escape(endereco)`

Para fazer a requisição deverá ser utilizada a gem `httparty`, a chamada é simples:

`HTTParty.get(url)`

A resposta será em JSON, portanto precisa ser parseada para ser utilizada corretamete:

`JSON.parse(json)`

Dentro da resposta JSON o conteúdo desejado deve estar na chave `results`.
Uma simulação total seria:

```ruby
require 'httparty'
endereco = 'Rua Casa do Ator, 275'.gsub(' ', '+')
escaped  = URI.escape(endereco)
url      = "http://maps.google.com/maps/api/geocode/json?address=#{escaped}"
response = HTTParty.get(url)
parsed   = JSON.parse(response.body)['results']
```

Essa funcionalidade deve ser implementada no `app.rb` na rota root `/`.
A informação do JSON podem ser impressa sem nenhum tratamento dentro de uma `<div></div>`
A funcionalidade deve ser desenvolvida seguindo a metodologia TDD.

O formulário HTML já esta feito, e ao ser submetido ele recarrega a mesma página porém
passando o conteúdo do `input` como uma query string `url` que pode ser acessada dentro de `app.rb`
da seguinte forma: `params['url']`.
