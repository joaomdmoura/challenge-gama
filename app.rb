# encoding: UTF-8
require 'rubygems'
require 'sinatra'
require 'httparty'

get '/' do
  erb :index, :locals => {result: nil}
end

post '/' do
  endereco = params["url"]
  escaped  = URI.escape(endereco)
  url      = "http://maps.google.com/maps/api/geocode/json?address=#{escaped}"
  response = HTTParty.get(url)
  totalTypes = JSON.parse(response.body)['results'][0]['address_components'].count
  parsed   = JSON.parse(response.body)['results'][0]['address_components'][totalTypes - 1]['long_name']

  erb :index, :locals => {result: parsed, url: params['url']}
end
