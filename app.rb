# encoding: UTF-8
require 'rubygems'
require 'sinatra'
require 'httparty'

get '/' do
  url = params[:url]
  
  request =  case url
              when nil then
                "nao digitou nada"
              when "" then
                "endereco invalido"
              else
                request_address(url)
              end
  
  erb :index, :locals => {result: request}
end

private
def request_address(url)
    escaped  = URI.escape(url)
    url      = "http://maps.google.com/maps/api/geocode/json?address=#{escaped}"
    response = HTTParty.get(url)
    parsed   = JSON.parse(response.body)['results']  
end

