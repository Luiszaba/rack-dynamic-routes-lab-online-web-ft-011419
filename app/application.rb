class Application
  
  @@item = [Item.new("Chocolate Chip", 1.99), Item.new("Almond",2.99), Item.new("Macadamea Nut", 3.99)]
  
  def call(env)
    resp = Rack::Response.new
    req =  Rack::Response.new(env)
    
    if req.path.match(/jar/)
      object = req.path.split("/jar/").last
      if retreave = @@item.find {|c| c.name==object}
        resp.write retreave.price
      else
        resp.status = 400
        resp.write "Page not found"
      end
    else 
      resp.status = 404
      resp.write "Object not found"
    end
    resp.finish
  end
end

      