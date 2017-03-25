# encoding: UTF-8
require 'rubygems'
require 'sinatra'
require 'httparty'

get '/' do
	endereco = params["url"]
	addressInfo = nil
	if (not(endereco.nil?))
		endereco = URI.escape(endereco)

		googleResponse = HTTParty.get("http://maps.google.com/maps/api/geocode/json?address=#{endereco}")
		googleResponse = googleResponse.parsed_response
		googleResult = googleResponse["results"]

		if not(googleResult[0].nil?)
			addressInfo = googleResult[0]["formatted_address"]
		else
			addressInfo = "Endereço não encontrado"
		end
	end

	erb :index, :locals => {result: addressInfo}
end
