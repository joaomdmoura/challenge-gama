# encoding: UTF-8
require_relative '../app'
require 'minitest/autorun'
require 'rack/test'

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_home
    get '/'
    assert_match /Busca de Endereço/, last_response.body
  end

  def test_home_busca_com_endereco
    get '/?url=rua jose gomes falcao, 304'
    assert_match "ChIJAbIz2gdYzpQR5oFUaol3BV8", last_response.body
  end

end
