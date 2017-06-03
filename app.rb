# encoding: UTF-8
require 'rubygems'
require 'sinatra'
require 'httparty'

get '/' do
 
  endereco = params[:url]
  if endereco.nil?
	result = ""
  else if endereco == ""
	result = "Endereço inválido"
  else
	escaped  = URI.escape(endereco)
	url      = "http://maps.google.com/maps/api/geocode/json?address=#{escaped}"
	response = HTTParty.get(url)
	result   = JSON.parse(response.body)['results']
  end
  end

  erb :index, :locals => {result: result}
end

