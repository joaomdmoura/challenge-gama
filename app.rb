# encoding: UTF-8
require 'rubygems'
require 'sinatra'
require 'httparty'

get '/' do
	escaped = URI.escape(params["url"])
	url      = "http://maps.google.com/maps/api/geocode/json?address=#{escaped}"
	response = HTTParty.get(url)
	parsed   = JSON.parse(response.body)['results']
  erb :index, :locals => {result: parsed}
end
