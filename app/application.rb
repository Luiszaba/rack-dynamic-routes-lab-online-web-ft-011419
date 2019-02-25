class CookieJar < Sinatra::Base
  
  def call(env)
    resp Rack::Response.new
    rep Rack::Response.new(env)