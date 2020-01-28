#require 'pry'

class Application
 
    @@item = Item.all

    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
   
      if req.path.match(/items/)
        search_name = req.path.split("/items/").last
        search_item = @@items.find{|i| i.name == search_name}
        #binding.pry
        if search_item == nil
            resp.write "Item not found"
            resp.status = 400
        else 
            resp.write "#{search_item.name}"
            resp.write "#{search_item.price}"
        end
      else
        resp.write "Route not found"
        resp.status = 404
      end
      resp.finish
    end
  end