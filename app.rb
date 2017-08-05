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
    response = HTTParty.get(encode_url(url))
    JSON.parse(response.body)['results']
  end

  erb :index, :locals => {result: result}
end

private

def encode_url(url)
  escaped = URI.escape(url)
  url = "http://maps.google.com/maps/api/geocode/json?address=#{escaped}"
end