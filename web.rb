require 'rubygems'
require 'sinatra'

# initialisation 

mode_debug = "Mode debug OFF<p>"
configure do
    data = ''
        f  = File.open('Gemfile.lock','r') 
            f.each_line do |line| 
            data << "#{line}" 
            end
     set :infogem,data 

end
before do
    # debug available in  local but not in cloud
    if env["SERVER_NAME"] == "localhost" then 
        puts "#{request.request_method} #{request.path_info}"
        mode_debug = "Mode debug ON<p>"
    end
end
get '/about' do
    @mode_debug = mode_debug
    @data = settings.infogem
    erb :about
end

get '/' do
   erb :index
end
