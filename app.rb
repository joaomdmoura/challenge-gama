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
    response = HTTParty.get(enconde_url(url))
    result = JSON.parse(response.body)['results']
  end

  erb :index, :locals => {result: result}
 end

private

  def enconde_url(url)
    escaped = URI.escape(url)
    url = "http://maps.google.com/maps/api/geocode/json?address=#{escaped}"
end

