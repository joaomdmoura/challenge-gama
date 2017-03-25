# encoding: UTF-8
require 'rubygems'
require 'sinatra'
require 'httparty'

get '/' do
  #puts params['url']
  erb :index, :locals => {result: params['url']}
end
