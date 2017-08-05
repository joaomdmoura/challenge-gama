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

  def test_home_valid_address_search
    get '/?url=avenida+paulista+1200'
    assert_match /Avenida Paulista/, last_response.body
  end

  def test_home_busca_invalida
    get '/?url='
    assert_match /endereco invalido/, last_response.body
  end
end
