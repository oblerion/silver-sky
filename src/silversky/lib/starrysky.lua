require("silversky.lib.stars")
function Starrysky()
    local starrysky = {
        stars = Stars()
    }
   -- starrysky.sky:finit()
    starrysky.stars:fgenerate()

    function starrysky.draw(self)
        --self.sky:fdraw()
        self.stars:fdraw()
    end
    return starrysky
end