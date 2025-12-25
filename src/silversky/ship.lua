function Ship(px,py)
    local ship = {
        x= px,
        y= py,
        img = love.graphics.newImage("asset/ship.png"),
        fdraw = function(self)
            love.graphics.draw(self.img,self.x,self.y,0)
        end
    }
    return ship
end