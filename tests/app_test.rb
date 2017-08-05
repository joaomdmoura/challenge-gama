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

  def test_home_busca_invalida
    get '/?url='
    assert_match "Endereço não preenchido", last_response.body
  end

  def test_home_busca_endereco_encontrado
    get '/?url=avenida+Flora'
    assert_match "Avenida Flora", last_response.body
  end
end
