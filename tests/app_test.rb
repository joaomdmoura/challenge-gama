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
    
    def test_not_null
        get '/?url='
        assert_match /Endereço Inválido/, last_response.body
    end

    def test_valid_street
        get '/?url=rua+da+paz+2150'
        assert_match /Rua da Paz/, last_response.body
    end
    
end
