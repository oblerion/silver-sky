function Sky()
    local sky = {
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
    }
    return sky 
end