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

# Campo em branco
  def test_blank_field
    get '/?url='
    assert_match "/endereco invalido/", last_response.body
  end 

# Endereço existe
  def test_blank_field
    get '/?url=avenida+paulista'
    assert_match /Paulista/, last_response.body
  end 
end


