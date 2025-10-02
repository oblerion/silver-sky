require "warframe.title"

local warframe = {
    scenetitle= {}
}

function warframe.load()
    warframe.scenetitle = Title()
end

function warframe.update(dt)
    print("update")
end

function warframe.draw()
    warframe.scenetitle:draw()
end

return warframe