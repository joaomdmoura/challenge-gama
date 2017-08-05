# encoding: UTF-8
require 'rubygems'
require 'sinatra'
require 'httparty'

get '/' do
	if params[:url] then 
		if params[:url] == '' then 
			erb :index, :locals => {result: nil, error: 'Endereço Inválido'}
		else
			escaped = URI.escape(params[:url])
			url      = "http://maps.google.com/maps/api/geocode/json?address=#{escaped}"
			response = HTTParty.get(url)
			parsed   = JSON.parse(response.body)['results']
			erb :index, :locals => {result: parsed.first, error: nil}
		end
	else
		erb :index, :locals => {result: nil, error: nil}	
	end
	
end
