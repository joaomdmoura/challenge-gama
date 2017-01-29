# encoding: UTF-8
require 'rubygems'
require 'sinatra'
require 'httparty'

def showdatas
 endereco = params['url'].gsub(' ', '+')
 escaped  = URI.escape(endereco)
 url      = "http://maps.google.com/maps/api/geocode/json?address=#{escaped}"
 response = HTTParty.get(url)
 parsed   = JSON.parse(response.body)['results']
 parsed[0]['address_components'][2]['long_name']
end

get '/' do
  erb :index, :locals => {result: showdatas}
end

post '/buscar' do

end
