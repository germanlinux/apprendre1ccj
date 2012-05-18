require 'rubygems'
require 'sinatra'

# initialisation 
data = ''
f  = File.open('Gemfile.lock','r') 
f.each_line do |line| 
    data += "#{line}" 
    end
mode_debug = "Mode debug OFF<p>"
configure do
# set :public_folder,  "static"
#    enable :logging 
end
before do
    # debug available in  local but not in cloud
    if env["SERVER_NAME"] == "localhost" then 
        puts "#{request.request_method} #{request.path_info}"
        mode_debug = "Mode debug ON<p>"
    end
end
get '/about' do

           
    erb '<span class ="label label-info">A propos:</span> <p>Le site <strong>Apprendre Une Chose Chaque Jour</strong> ( A1CCJ) est realis&#233; avec le framework <a href = http://www.sinatrarb.com>Sinatra</a> pour <a href =http://www.ruby-lang.org>Ruby</a>.</p><p>Il fonctionne comme une application web sous le cloud <a href =http://heroku.com>Heroku</a>.</p><p>Le style du site utilise l&#39;habillage <a href = http://twitter.github.com/bootstrap>Bootstrap</a> de <a href= https://twitter.com>twitter</a> pr&#233;par&#233; par <a href= https://github.com/pokle/sinatra-bootstrap>Pokle.net</a>  </p><p>La couche HTTP est fournie par le serveur <a href=http://code.macournoyer.com/thin/ >web thin</a>. Enfin, <a href=http://rack.github.com/ >Rack</a> assure la couche middleware.</p><span class ="label label-info">Pour contribuer:</span><p>Les sources du projet sont disponibles sur ce lien:<address><a href=https://github.com/germanlinux/apprendre1ccj >https://github.com/germanlinux/apprendre1ccj  </a></address><span class="label label-success">Version 0.0</span> ' + '<pre>' + mode_debug +  data + '</pre>'

end

get '/' do
   erb 'Hello, world'
end
