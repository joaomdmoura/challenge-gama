# encoding: UTF-8
require_relative '../app'
require 'minitest/autorun'
require 'rack/test'
require 'httparty'

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_home_busca_de_endereco
    get '/'
    assert_match /Busca de Endereço/, last_response.body
  end

  def test_home_endereco_search_ok
    get '/?url=Av+Paulista'
    assert_match /Avenida Paulista/, last_response.body
  end

  def test_home_endereco_search_failure
    get '/?url=Av+Paulista'
    testVar = assert_match /Avenida Paulista/, last_response.body
    not(testVar)
  end

  def test_google_connection_ok
  	testVar = HTTParty.get("http://maps.google.com/maps/api/geocode/json?address=Av+Paulista")
  	assert_match /Avenida Paulista/, testVar.body
  end

  def test_google_connection_failure
  	testVar = HTTParty.get("http://maps.google.com/maps/api/geocode/json?address=Av+Paulista")
  	not(assert_match /Avenida Paulista/, testVar.body)
  end
end
