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
    assert_match /nao digitou nada/, last_response.body
  end

  def test_home_se_nao_tem_nada_retornar_msg
    get '/?url='
    
    assert_match /endereco invalido/, last_response.body
  end

  #  def test_home_buscou_por_nada
  #    get ''
    
  #    assert_match /Nao tem o que procurar/, last_response.body

  #  end
  
  
end
