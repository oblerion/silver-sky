function Starrysky()
    local starrysky = {
        sky = {
            canvas = {},
            finit = function(self)
                --Définir la résolution de la toile (basse pour un effet pixélisé)
                local canvasWidth, canvasHeight = love.graphics.getWidth(), love.graphics.getHeight() -- Résolution basse pour le style pixel art
                self.canvas = love.graphics.newCanvas(canvasWidth, canvasHeight)
                
                -- Désactiver le filtrage pour un rendu net (pixelisé)
                self.canvas:setFilter("nearest", "nearest")

                -- Générer le ciel sur la toile
                love.graphics.setCanvas(self.canvas)
                love.graphics.clear()

                -- Dégradé de couleur (bleu foncé à bleu clair)
                for y = 0, canvasHeight - 1 do
                    -- Interpolation linéaire pour le dégradé
                    local t = y / canvasHeight
                    local r = 50
                    local g = math.floor(50 * (1 - t)) -- Dégradé de vert/bleu
                    local b = math.floor(100 + 155 * (1 - t)) -- Plus clair en haut
                    love.graphics.setColor(r / 255, g / 255, b / 255)
                    love.graphics.line(0, y, canvasWidth, y)
                end
                -- Revenir au rendu par défaut
                love.graphics.setCanvas()
                love.graphics.setColor(1,1,1,1)
            end,
            fdraw = function(self)
                love.graphics.draw(self.canvas,0,0,0)
            end
        },
        stars = {
            list={},
            fgenerate=function(self)
                local canvasWidth, canvasHeight = love.graphics.getWidth(), love.graphics.getHeight() 
                -- Ajouter des étoiles aléatoires
                local numStars = 50
                for i = 1, numStars do
                    local x = math.random(0, canvasWidth - 1)
                    local y = math.random(0, canvasHeight - 1)
                    local brightness = math.random(1, 3) -- Luminosité variable
                    table.insert(self.list,{x=x,y=y,brightness=brightness})
        
                end
            end,
            fclear=function(self)
                self.list={}
            end,
            fdraw=function(self)
                love.graphics.setColor(1,1,1,1)
                for n,v in pairs(self.list) do
                    --love.graphics.setColor(1, 1, v.brightness, 1)
                    --love.graphics.points(v.x, v.y)
                    if(v.x>0)then 
                        v.x = v.x - 1
                    else
                        v.x = love.graphics.getWidth()
                    end
                    love.graphics.rectangle("fill",v.x,v.y,v.brightness,v.brightness)
                end
            
            end
        }
    }
    starrysky.sky:finit()
    starrysky.stars:fgenerate()

    function starrysky.draw(self)
        self.sky:fdraw()
        self.stars:fdraw()
    end
    return starrysky
end