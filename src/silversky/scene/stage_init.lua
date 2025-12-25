require "silversky.ship"
require "silversky.lib.gradient"
   local sw = love.graphics.getWidth()
    local sh = love.graphics.getHeight()
function Stage_init(mecha)
 
    local stage_init = {
        background = createGradientCanvas(sw,sh,{0,0.4,1},{0,0,1},""),
        mecha = mecha,
        ship = Ship(-20,10)
    }

    stage_init.mecha.x = sw/4
    stage_init.mecha.scale = 1
    local scalestep = (3/((sh/5)-10))

    function stage_init.load(self)
        
    end

    function stage_init.update(self)
      local rb = false
      if self.ship.x > sw/4 then
          if self.mecha.y < sh-self.mecha.img:getHeight()*3 then
              self.mecha.y = self.mecha.y + 5
          else
            rb =true
          end
          if self.mecha.scale < 3 then
              self.mecha.scale = self.mecha.scale + scalestep
          else
              self.mecha.scale=3
          end
      end
      if self.ship.x<sw+50 then
          self.ship.x = self.ship.x + 5
      end
      return rb
    end

    function stage_init.draw(self)
        love.graphics.draw(self.background,0,0,0)
        if self.ship.x > sw/4 then
            self.mecha:fdraw()
        end
        if self.ship.x<=sw then

            self.ship:fdraw()
        end
    end
    return stage_init
end

