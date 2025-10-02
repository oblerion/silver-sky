require "starrysky"
require "button"
function Title()
    local title = {
        titleimg = love.graphics.newImage("asset/title.png"),
        --sky = love.graphics.newImage("asset/red-sky2.jpg"),
        cursor_ship = {
            ship = love.graphics.newImage("asset/ship.png"),
            x=0,
            y=0,
            scale = 1,
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
        },
        starrysky = Starrysky(),
        button_start = Button()
    }

    title.button_start:initImage("asset/start_btn.png","asset/start_btn2.png")
    title.button_start:setScale(3)

    function title.draw(self)
        self.starrysky:draw()
        love.graphics.draw(self.titleimg,
            love.graphics.getWidth()/2 - (4*self.titleimg:getWidth())/2,
            100,0,4,4)
        if self.button_start:draw(
            love.graphics.getWidth()/2 - self.button_start:getWidth()/2,
            500) then
            print("ee")
        end

        self.cursor_ship:fupdate()
        self.cursor_ship:fdraw()

    end
    love.mouse.setVisible(false)
    return title
end