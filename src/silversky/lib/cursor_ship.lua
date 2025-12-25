function CursorShip()
    local cursor_ship = {
        ship = love.graphics.newImage("asset/ship.png"),
        x=0,
        y=0,
        scale = 1,
        freset = function(self)
            self.x=0
            self.y=0
        end,
        fupdate = function(self)
            self.y = love.mouse.getY()
            self.x = love.mouse.getX()
            self.y = self.y + math.sin(love.timer.getTime())*20
            self.x = self.x + math.cos(love.timer.getTime())*5
        end,
        fdraw = function(self)
            love.graphics.draw(
                self.ship,
                self.x-self.ship:getWidth()/2,
                self.y-self.ship:getHeight()/2,
                0,self.scale,self.scale)
        end
    } 
    return cursor_ship
end