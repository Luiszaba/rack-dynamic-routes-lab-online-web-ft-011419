class Application
  

  
  def call(env)
    
      @@items = [
 Item.new("Figs",3.42),
 Item.new("Pears",0.99)
            ]
            
    resp = Rack::Response.new
    req =  Rack::Response.new(env)
    
      if req.path.match(/items/)
        dynamic = req.path.split("/items/").last
      if  g = @@items.detect { |i|i.name == dynamic}
        resp.write "You requested the #{g.price}"
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

      