class Application

    @@items = []

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        

        if req.path.match(/item/)
            search = req.path.split("/items/").last
            item  = @@items.find do |item|
                item.name == search
            end
                if item == nil
                    resp.write "Item not found"
                    resp.status = 400
                else
                resp.write item.price
                end
        else
            resp.write "Route not found"
            resp.status = 404
        end

        resp.finish

    end

    def self.items
        @@items
    end
end