require "silversky.lib.button"
function Credit()
    local credit = {
        btnback = Button(),
        text = love.graphics.newText(
            love.graphics.newFont("asset/Softball_Gold.ttf",20),
            "code______________magnus oblerion".."\n"..
            "drawing___________magnus oblerion")
    }

    credit.btnback:initText("Back",
        love.graphics.newFont("asset/Softball_Gold.ttf",25),
        {1,1,1},{0.8,0.8,0.8})

    function credit.load(self)
     
    end

    function credit.update(self)
      
    end

    function credit.draw(self)
        love.graphics.draw(self.text,50,300)
       if self.btnback:draw(
        love.graphics.getWidth()/2 - self.btnback:getWidth()/2,
        300)==true then 
            return true
       end
       return false
    end
    return credit
end