class CookieJar < Sinatra::Base
  
  def call(env)
    req.response::