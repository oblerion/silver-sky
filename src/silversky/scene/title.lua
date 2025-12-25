require "silversky.lib.stars"
require "silversky.lib.button"

function Title()
    local title = {
        fontTitle = love.graphics.newFont("asset/Softball_Gold.ttf",126),
        fontText = love.graphics.newFont("asset/Softball_Gold.ttf",25),
        titleimg = love.graphics.newImage("asset/title.png"),
        --sky = love.graphics.newImage("asset/red-sky2.jpg"),
        button_start = Button(),
        button_option = Button(),
        button_credit = Button()
    }
    title.textTitle = love.graphics.newText(title.fontTitle,"Silver Sky")
    title.textAuthor = love.graphics.newText(title.fontText,"by Oblerion Studio")

    --title.button_start:initImage("asset/start_btn.png","asset/start_btn2.png")
    --title.button_start:setScale(3)

    title.button_start:initText("Start",
        love.graphics.newFont("asset/Softball_Gold.ttf",25),
        {1,1,1},{0.8,0.8,0.8})
    title.button_option:initText("Option",
        love.graphics.newFont("asset/Softball_Gold.ttf",25),
        {1,1,1},{0.8,0.8,0.8})
    title.button_credit:initText("Credit",
        love.graphics.newFont("asset/Softball_Gold.ttf",25),
        {1,1,1},{0.8,0.8,0.8})
    function title.load(self)
    end
    function title.draw(self)
        love.graphics.draw(self.textTitle, --self.titleimg,
            math.floor(love.graphics.getWidth()/2 - (self.textTitle:getWidth())/2),
            100,0)
        if self.button_start:draw(
            love.graphics.getWidth()/2 - self.button_start:getWidth()/2,
            350) then
            return 1
        end

        if self.button_option:draw(
            love.graphics.getWidth()/2 - self.button_option:getWidth()/2,
            450) then
                return 2
        end

        if self.button_credit:draw(
            love.graphics.getWidth()/2 - self.button_option:getWidth()/2,
            550) then
                return 3
        end

        love.graphics.draw(self.textAuthor,20,love.graphics.getHeight()-self.textAuthor:getHeight()-5)

        return false
    end
    love.mouse.setVisible(false)
    return title
end