# encoding: UTF-8
require 'rubygems'
require 'sinatra'
require 'httparty'

get '/' do
 
   url = params[:url]

   result = case url
              when "" then
                "endereco invalido"
              when nil then
                " "
              else
                escaped  = URI.escape(url)
                url      = "http://maps.google.com/maps/api/geocode/json?address=#{escaped}"
                response = HTTParty.get(url)
                 JSON.parse(response.body)['results']   
              end

  erb :index, :locals => {result: result}
end
