# encoding: UTF-8
require 'rubygems'
require 'sinatra'
require 'httparty'

get '/' do

  endereco = params["url"]

  if endereco
    
    endereco_escape = URI.escape(endereco)
    url = "http://maps.google.com/maps/api/geocode/json?address=#{endereco_escape}"
    response = HTTParty.get(url)
    parsed = JSON.parse(response.body)['results']

    erb :index, :locals => {result: parsed}
  else
    erb :index, :locals => {result: nil}
  end

end
