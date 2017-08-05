# encoding: UTF-8
require_relative '../app'
require 'minitest/autorun'
require 'rack/test'

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_home_busca_de_endereco
    get '/'
    assert_match /Busca de Endereço/, last_response.body
  end
  
  def test_valid_address
    get '/?endereco=avenida+paulista+1200'
    assert_match /Av. Paulista, 1200/, last_response.body
  end
  
  def test_blank_address
    get '/?endereco='
    assert_match /endereço inválido/, last_response.body
  end
end
