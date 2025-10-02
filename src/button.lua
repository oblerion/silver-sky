function Button()
    local button = {
        w=0,
        h=0,
        type="",
        scale=1,
        obj={},
        obj2={}
    }

    function button.initImage(self,imgpath,imgpath2)
        self.type = "image"
        self.obj = love.graphics.newImage(imgpath)
        self.obj2 = love.graphics.newImage(imgpath2)
        self.w = self.obj:getWidth()
        self.h = self.obj:getHeight()
    end

    function button.setScale(self,scale)
        self.scale = scale
        self.w = self.w*self.scale 
        self.h = self.h*self.scale
    end

    function button.getWidth(self)
        return self.w
    end

    function button.getHeight(self)
        return self.h
    end

    function button.isSelect(self,x,y)
        local mx = love.mouse.getX()
        local my = love.mouse.getY()
        if x+self.w > mx and 
            x < mx + 10 and
            y+self.h > my and
            y < my+10 then 
            return true
        end
        return false
    end

    function button.isDown(self,x,y)
        if love.mouse.isDown(1) and self:isSelect(x,y) then 
            return true
        end
        return false
    end

    function button.draw(self,x,y)
        if self.type == "image" then
            if not self:isSelect(x,y) then 
                love.graphics.draw(self.obj,x,y,0,self.scale,self.scale)
            else
                love.graphics.draw(self.obj2,x,y,0,self.scale,self.scale)
            end
        end

        if self:isDown(x,y) then 
            return true
        end
        return false
    end
    return button
end