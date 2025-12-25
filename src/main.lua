--debug
io.stdout:setvbuf('no')
if arg[#arg] == "-debug" then require("mobdebug").start() end
love.graphics.setDefaultFilter("nearest")

love.graphics.setNewFont("asset/Softball_Gold.ttf",16)

-- require "silversky.lib.gradient"
--local grad = createGradientCanvas(100,100,{1,0,0,1},{0,0,0,1},"")

local silversky = require "silversky"
  
function love.load()
  silversky.load()
   -- love.graphics.setColor(0,0.2,0.8,1)
end

function love.update(dt)
    silversky.update(dt)
end

function love.draw()
    love.graphics.clear()
    silversky.draw()
    --love.graphics.draw(grad,100,100)
end
