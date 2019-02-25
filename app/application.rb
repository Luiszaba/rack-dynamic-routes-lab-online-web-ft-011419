class Application
  
  @@items = [
 Item.new("Figs",3.42),
 Item.new("Pears",0.99)
            ]
  
  def call(env)
    resp = Rack::Response.new
    req =  Rack::Response.new(env)
    
    if req.path.match(/items/)
      dynamic = req.path.split("/items/").last
      if i = @@items.detect {|c| c.name == dynamic}
        resp.write "#{i.price}"
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

      