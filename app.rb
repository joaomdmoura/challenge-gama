# encoding: UTF-8
require 'rubygems'
require 'sinatra'
require 'httparty'

get '/' do
    if (params['url']) != nil
        endereco = params['url']
        escaped  = URI.escape(endereco)
        url      = "http://maps.google.com/maps/api/geocode/json?address=#{escaped}"
        response = HTTParty.get(url)
        parsed   = JSON.parse(response.body)['results']
        erb :index, :locals => {result: parsed}
    else
        erb :index, :locals => {result: nil}
    end
end
