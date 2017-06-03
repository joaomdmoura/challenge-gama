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
        "Endereço Inválido"
    
    else
        endereco = URI.escape(url)         
        url= "http://maps.google.com/maps/api/geocode/json?address=#{endereco}"
        response = HTTParty.get(url)
        result = JSON.parse(response.body)['results']
    end
    erb :index, :locals => {result: result}
end
    