class Application
  
  @@items = [
  Item.new("Chocolate Chip", 1.99), 
  Item.new("Almond",2.99), 
  Item.new("Macadamea Nut", 3.99)
            ]
  
  def call(env)
    resp = Rack::Response.new
    req =  Rack::Response.new(env)
    
    if req.path.match(/items/)
      dynamic = req.path.split("/items/").last
      if i = @@items.detect {|c| c.name==object}
        resp.write "#{c.price}"
      else
        resp.status = 400
        resp.write "Item not found"
      end
    else 
      resp.status = 404
      resp.write "Route not found"
    end
    resp.finish
  end
end

      