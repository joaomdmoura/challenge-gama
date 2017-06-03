# encoding: UTF-8
require 'rubygems'
require 'sinatra'
require 'httparty'

get '/' do
  url = params[:url]
  
  result =  case url
            when nil
              "endereco invalido"
            when ""
              "endereco invalido"
            else
              send(url)
            end
end

private
def send(url)
    escaped  = URI.escape(url)
    url      = "http://maps.google.com/maps/api/geocode/json?address=#{escaped}"
    response = HTTParty.get(url)
    parsed   = JSON.parse(response.body)['results']  
end

