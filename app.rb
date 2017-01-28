# encoding: UTF-8
require 'rubygems'
require 'sinatra'
require 'httparty'

get '/' do
    if params[:url]
        endereco = params[:url]
        endereco_escaped = URI.escape(endereco)
        url = "http://maps.google.com/maps/api/geocode/json?address=#{endereco_escaped}"
        response = HTTParty.get(url)
        parsed   = JSON.parse(response.body)['results']
    end

    erb :index, :locals => {result: parsed}
end
