class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = Item.all.find { |item| item.name == req.path.split("/items/").last  }
      if Item.all.include?(item) == true
        resp.write item.price
      elsif Item.all.include?(item) == false
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
