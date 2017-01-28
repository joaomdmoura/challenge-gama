# encoding: UTF-8
require 'rubygems'
require 'sinatra'
require 'httparty'

get '/' do
  parsed = if params['url']
    escaped  = URI.escape(params['url'])
    url      = "http://maps.google.com/maps/api/geocode/json?address=#{escaped}"
    response = HTTParty.get(url)
    JSON.parse(response.body)['results']
  end

  erb :index, :locals => {result: parsed}
end
