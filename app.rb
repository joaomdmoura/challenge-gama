require 'sinatra'

get '/' do
  erb :index, :locals => {hello: "world"}
end
