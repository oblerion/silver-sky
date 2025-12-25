require "silversky.lib.button"

function UnknowChapter()
    local canvas = love.graphics.newCanvas(300,300)
    love.graphics.setCanvas(canvas)
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("fill",0,0,300,300)
    love.graphics.setColor(1,1,1)
    local t = love.graphics.newText(
        love.graphics.newFont("asset/Softball_Gold.ttf",24),
        "???"
    )
    love.graphics.draw(t,
    150-t:getWidth()/2,
    150-t:getHeight()/2)
    love.graphics.setColor(1,1,1)
    love.graphics.rectangle("line",0,0,300,300)
    love.graphics.setCanvas()
    return canvas
end

function Chapter()
    local chapter = {
        imgchap1 = love.graphics.newImage("asset/silversky_chap1.png"),
        texttitle = love.graphics.newText(
            love.graphics.newFont(
                "asset/Softball_Gold.ttf",58
            ),
            "Choose chapter"
        ),
        btn_chap1 = Button(),
        ukw_chap = UnknowChapter()

    }

    chapter.btn_chap1:initImage(
        "asset/silversky_chap1.png"
    )
    function chapter.load(self)
        
    end

    function chapter.update(self)
      
    end

    function chapter.draw(self)
        local offsetx = (love.graphics.getWidth()-(300*3))/2
        local offsety = (love.graphics.getHeight()-300)/2
        love.graphics.draw(self.texttitle,
            (love.graphics.getWidth()-self.texttitle:getWidth())/2,
            100)
    
       if self.btn_chap1:draw(offsetx,offsety) then 
-- game
       end

        love.graphics.draw(chapter.ukw_chap,offsetx+300,offsety)
        love.graphics.draw(chapter.ukw_chap,offsetx+600,offsety)
    end
    return chapter
end