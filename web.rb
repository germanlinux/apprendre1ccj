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
    sentences = []
      f  = File.open('segments2.csv','r') 
      f.each_line do |line| 
      sentences.push line 
    end
    set :phrases, sentences
end
before do
    # debug available in  local but not in cloud
    if env["SERVER_NAME"] == "localhost" then 
        puts "#{request.request_method} #{request.path_info}"
        mode_debug = "Mode debug ON<p>"
    end
    time = Time.new
    @quantieme  = time.yday
    @madate    = time.strftime("%d/%m/%Y")
    @quantieme  = time.yday - 139
    
end
get '/about' do
    @mode_debug = mode_debug
    @data = settings.infogem
    erb :about
end

get '/' do
   une_phrase = settings.phrases[@quantieme]  
   un_jour = une_phrase.split(/;/)
   @tag     =  un_jour[1]
   if @tag  == "Industrie" then 
        @ltag =  '<span class="btn-info btn-large disabled">' + @tag + '</span>'
   end
   if @tag  == "Informatique" then 
        @ltag =  '<span class="btn-success btn-large disabled">' + @tag + '</span>'
   end
if @tag  == "Histoire" then 
        @ltag =  '<span class="btn-danger btn-large disabled">' + @tag + '</span>'
   end
if @tag  == "Geo" then 
        @ltag =  '<span class="btn-warning btn-large disabled">' + @tag + '</span>'
   end
if @tag  == "Sport" then 
        @ltag =  '<span class="btn-inverse btn-large disabled">' + @tag + '</span>'
   end

   @content =  un_jour[2]
   un_jour[5].chomp!
   if un_jour[5].to_i > 0 then 
    @content += "<p>#{un_jour[4]}<p>"
   end
   erb :index
end
