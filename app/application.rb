class Application

    @@items = [Item.new("peach",4.22), Item.new("Pear", 1.99), Item.new("Apple", 2.99)]

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

    if req.path.match(/items/)
    item_name = req.path.split("/items/").last
    if item =@@items.find{|item| item.name == item_name}
    resp.write item.price 
    else
        resp.write "Item not found"
        resp.status = 400
    end
else
    resp.write "Route not found"
    resp.status = 404
    end

    resp.finish
end
end
