# encoding: UTF-8
require 'rubygems'
require 'sinatra'
require 'httparty'

get '/' do
  url = params[:url]
  result = case url

  when nil
  	""
  when ""
  	"endereco invalido"
  else
  result = "endereco invalido" if url ==""
  endereco = params[:url].gsub(' ', '+')
  escaped  = URI.escape(endereco)
  url      = "http://maps.google.com/maps/api/geocode/json?address=#{escaped}"
  response = HTTParty.get(url)
  result   = JSON.parse(response.body)['results']
end
  erb :index, :locals => {result: result}
end
