class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items\/[a-zA-Z0-9]/)
      item = req.path.split("/items/").last
      result = Item.all.find { |i| i.name == item }
      if result
        resp.write result.price
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

end # end class Application
