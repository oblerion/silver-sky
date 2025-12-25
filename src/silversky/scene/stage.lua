
function Stage()
    local stage = {
        player = {
            x=100,
            y=0,
            img = love.graphics.newImage("asset/hermes-p.png"),
            fupdate = function(self)

            end,
            fdraw = function(self)
                love.graphics.draw(self.img,self.x,self.y,0,3,3)
            end
        }
    }

    function stage.load(self)
        
    end

    function stage.update(self)
        if self.player.y < 400 then
            self.player.y = self.player.y + 1
        end
    end

    function stage.draw(self)
        self.player:fdraw()
    end
    return stage
end