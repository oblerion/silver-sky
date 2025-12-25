require "silversky.scene.title"
require "silversky.scene.stage"
require "silversky.scene.stage_init"
require "silversky.scene.chapter"
require "silversky.scene.credit"
require "silversky.lib.stars"
require "silversky.lib.cursor_ship"
require "silversky.mecha"

local silversky = {
    scene = "title",
    starrysky = Stars(),
    scenetitle= {},
    mecha = Mecha(0,0),
    cursor_ship = CursorShip()
}

function silversky.load()
    silversky.starrysky:fgenerate()
    silversky.scenetitle = Title()
    silversky.sceneStage = Stage()
    silversky.sceneStageInit = Stage_init(silversky.mecha)
    silversky.sceneChapter = Chapter()
    silversky.sceneCredit = Credit()
end

function silversky.update(dt)
    ---print("update")
    if silversky.scene=="stage" then 
        --silversky.sceneStage:update()
        silversky.sceneStageInit:update()
    end
end

function silversky.draw()
    -- fond étoilé
    if silversky.scene=="title" or 
        silversky.scene=="chapter" or 
        silversky.scene=="credit" then 
            love.graphics.setBackgroundColor(0,0,0)
            silversky.starrysky:fdraw()
    end


    if silversky.scene=="title" then
        local state = silversky.scenetitle:draw()
        if state == 1 then
            silversky.scene = "chapter"
        elseif state == 2 then 
-- option
        elseif state == 3 then 
-- credit
            silversky.scene = "credit"
            silversky.sceneCredit:load()
        end
    elseif silversky.scene=="chapter" then
        silversky.sceneChapter:draw()
    elseif silversky.scene=="credit" then 
        if silversky.sceneCredit:draw()==true then 
            silversky.scene="title"
            silversky.scenetitle:load()
        end
    elseif silversky.scene=="stage" then
        --silversky.sceneStage:draw()
        silversky.sceneStageInit:draw()
    end

    if silversky.scene=="title" or 
        silversky.scene=="chapter" or 
        silversky.scene=="credit" then 
            silversky.cursor_ship:fupdate()
            silversky.cursor_ship:fdraw()
    end
end

return silversky