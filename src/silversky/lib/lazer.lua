
function Lazer(px,py,px2,py2,pcolor)
    local lazer = {
        x=px,
        y=py,
        x2=px2,
        y2=py2,
        color=pcolor,
        list={}
    }
    function lazer.draw(self)
        love.graphics.setColor(self.color.r,self.color.g,self.color.b)
        local w = self.x-self.x2
        local h = self.y-self.y2
        local spdx = 0
        local spdy = 0
        if math.abs(w)>math.abs(h) then 
            --h = math.abs(h * math.sin(love.timer.getTime()*2))
            h=4
            w=1
            if w>0 then
                spdx = -5
            else
                spdx = 5
            end
        else 
            w=2
            h=4
            if h>0 then
                spdy = -5
            else
                spdy = 5
            end
            --w = math.abs(w * math.sin(love.timer.getTime()*2))
        end
        local p = {x=self.x2,y=self.y2,w=w,h=h,spdx=spdx,spdy=spdy}
        table.insert(self.list,p)

        for n,v in pairs(self.list) do
            if  v.x+v.w > 0 and 
            v.x < love.graphics.getWidth() and
            v.y+v.h > 0 and
            v.y < love.graphics.getHeight() then 
                v.x = v.x + v.spdx
                v.y = v.y + v.spdy
                love.graphics.circle("fill",v.x,v.y,v.w*v.h)
            else
                table.remove(self.list,n)
            end
           
        end
        --love.graphics.rectangle("fill",self.x,self.y+h/2,w+5,h+5)
        love.graphics.setColor(1,1,1,1)
    end
    return lazer
end