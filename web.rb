require 'rubygems'
require 'sinatra'

# initialisation 
data = ''
f  = File.open('Gemfile.lock','r') 
f.each_line do |line| 
    data += "#{line}" 
    end

configure do
# set :public_folder,  "static"
#    enable :logging 
end
before do
    # debug available in  local but not in cloud
    if env["SERVER_NAME"] == "localhost" then 
        puts "#{request.request_method} #{request.path_info}"
    end
end
get '/about' do

           
    erb '<span class ="label label-info">A propos:</span> <p>Le site <strong>Apprendre Une Chose Chaque Jour</strong> ( A1CCJ) est realis&#233; avec le framework <a href = http://www.sinatrarb.com>Sinatra</a> pour <a href =http://www.ruby-lang.org>Ruby</a>.</p><p>Il fonctionne comme une application web sous le cloud <a href =http://heroku.com>Heroku</a>.</p><p>Le style du site utilise l&#39;habillage <a href = http://twitter.github.com/bootstrap>Bootstrap</a> de <a href= htpps://twitter.com>twitter</a> pr&#233;par&#233; par <a href= https://github.com/pokle/sinatra-bootstrap>Pokle.net</a>  </p> ' + '<pre>' + data + '</pre>'

end

get '/' do
   erb 'Hello, world'
end
