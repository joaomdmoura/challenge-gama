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

  def test_show_busca_de_endereco
    get '/?url=Avenida+Paulista+2002'
    assert_match /Avenida Paulista/, last_response.body
  end

  def test_formulario_em_branco
    get '/'
    #puts last_response.body
    assert last_response.ok?
  end

end
