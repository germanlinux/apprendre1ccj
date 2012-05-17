require 'rubygems'
require 'sinatra'

configure do
  set :public_folder,  "/static"
end

get '/' do
   erb 'Hello, world'
end
