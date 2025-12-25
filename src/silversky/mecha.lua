
function Mecha(x,y)
    local mecha = {
        x=x,
        y=y,
        scale=3,
        img = love.graphics.newImage("asset/hermes-p.png"),
        
        fdraw = function(self)
            love.graphics.draw(self.img,self.x,self.y,0,self.scale,self.scale)
        end
    }
    return mecha
end