--debug
io.stdout:setvbuf('no')
if arg[#arg] == "-debug" then require("mobdebug").start() end
love.graphics.setDefaultFilter("nearest")

local warframe = require "warframe"

function love.load()
    warframe.load()
   -- love.graphics.setColor(0,0.2,0.8,1)
end

function love.update(dt)
    warframe.update(dt)
end

function love.draw()
    love.graphics.clear()
    warframe.draw()
end
