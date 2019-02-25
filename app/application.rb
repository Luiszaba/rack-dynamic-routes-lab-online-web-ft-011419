class CookieJar < Sinatra::Base
  
  @@jar = [Cookie.new("Chocolate Chip", 1.99), Cookie.new("Almond",2.99), Cookie.new("Macadamea Nut", 3.99)]
  
  def call(env)
    resp = Rack::Response.new
    req =  Rack::Response.new(env)
    
    if req.path.match(/jar/)
      object = req.path.split("/jar/").last
      if object = @@jar.find {|c| c.name==object} 
      