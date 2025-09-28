--debug
io.stdout:setvbuf('no')
if arg[#arg] == "-debug" then require("mobdebug").start() end
love.graphics.setDefaultFilter("nearest")

local warframe = require "warframe"

function love.load()
    warframe.load()
end

function love.update(dt)
    warframe.update(dt)
end

function love.draw()
    warframe.draw()
end
