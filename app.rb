# encoding: UTF-8
require 'rubygems'
require 'sinatra'
require 'httparty'

get '/' do
  erb :index, :locals => {result: nil}
end

post '/' do
  #endereco = 'Rua Casa do Ator, 275'.gsub(' ', '+')
  #escaped  = URI.escape(endereco)
  #url      = "http://maps.google.com/maps/api/geocode/json?address=#{escaped}"
  #response = HTTParty.get(url)
  #parsed   = JSON.parse(response.body)['results']

  erb :index, :locals => {result: nil}
end
