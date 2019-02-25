class CookieJar < Sinatra::Base
  
  def call(env)
    resp = Rack::Response.new
    req =  Rack::Response.new(env)
    
    if req.path.match(/jar/)
      