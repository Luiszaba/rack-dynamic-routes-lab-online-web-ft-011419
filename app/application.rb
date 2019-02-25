class CookieJar < Sinatra::Base
  
  @@jar = [Cookie.new("Chocolate Chip"), Cookie.new("Almond", Cookie.new(Macadamea Nut)]
  
  def call(env)
    resp = Rack::Response.new
    req =  Rack::Response.new(env)
    
    if req.path.match(/jar/)
      object = req.path.split("/jar/").last
      if object = @@jar.find {|c| c.name==object} 
      