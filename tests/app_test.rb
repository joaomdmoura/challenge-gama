# encoding: UTF-8
require_relative '../app'
require 'minitest/autorun'
require 'rack/test'
require 'sinatra'
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

  def test_requisicao
      endereco = "Rua casa do ator, sp"
      endereco_escaped = URI.escape(endereco)
      url = "http://maps.google.com/maps/api/geocode/json?address=#{endereco_escaped}"
      response = HTTParty.get(url)
      assert(200, response.code)
  end
end
