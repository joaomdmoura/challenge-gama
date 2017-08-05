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

  def test_home_busca_de_endereco_information
    get '/?url=Avenida+Mato+Grosso+1010'
    assert_match /Avenida Mato Grosso/, last_response.body
  end

  def test_home_busca_invalida
    get '/?url='
    assert_match /Endereço Inválido/, last_response.body
  end

end
