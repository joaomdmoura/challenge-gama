# encoding: UTF-8
require 'rubygems'
require 'sinatra'
require 'httparty'

get '/' do

  endereco = params['url']
  escaped  = URI.escape(endereco)

  erb :index, :locals => {result: escaped}
end
