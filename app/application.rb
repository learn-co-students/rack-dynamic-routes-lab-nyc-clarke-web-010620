class Application
    
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
            
        if req.path.match(/items/)
            found_item = @@items.find do |item|
                item.name == req.path.split("/").last
            end
                if found_item
                    resp.write found_item.price
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
