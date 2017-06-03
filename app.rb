# encoding: UTF-8
require 'rubygems'
require 'sinatra'
require 'httparty'

get '/' do
	url = params[:url]
	if url.nil?
		result=''
 	elsif url == '' then
 		result = "Endereço Invalido" 
 	else
 		url = url.gsub(' ', '+')
 		url = URI.escape(url)
 		response = HTTParty.get("http://maps.google.com/maps/api/geocode/json?address="+url)
 		result = JSON.parse(response.body)['results']
 	end
  	erb :index, :locals => {result: result}
end