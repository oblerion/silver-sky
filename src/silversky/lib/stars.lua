function Stars()
    local stars = {
        list={},
        fgenerate=function(self)
            local canvasWidth, canvasHeight = love.graphics.getWidth(), love.graphics.getHeight() 
            -- Ajouter des étoiles aléatoires
            local numStars = 50
            for i = 1, numStars do
                local x = math.random(0, canvasWidth - 1)
                local y = math.random(0, canvasHeight - 1)
                local brightness = math.random(1, 3) -- Luminosité variable
                local r = math.random(0.6,1)
                local g = math.random(0.6,1)
                local b = math.random(0.6,1)
                table.insert(self.list,{x=x,y=y,brightness=brightness,color={r=r,g=g,b=b}})

            end
        end,
        fclear=function(self)
            self.list={}
        end,
        fdraw=function(self)
            for n,v in pairs(self.list) do
                love.graphics.setColor(v.color.r,v.color.g,v.color.b,1)
                --love.graphics.setColor(1, 1, v.brightness, 1)
                --love.graphics.points(v.x, v.y)
                if(v.x>0)then 
                    v.x = v.x - v.brightness
                else
                    v.x = love.graphics.getWidth()
                end
                love.graphics.rectangle("fill",v.x,v.y,v.brightness,v.brightness)
            end
            love.graphics.setColor(1,1,1,1)
        end
    }
    return stars
end