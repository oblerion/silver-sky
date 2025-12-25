function createGradientCanvas(width, height, color1, color2, direction)
    -- Créer un nouveau canvas
    local canvas = love.graphics.newCanvas(width, height)
    
    -- Définir les couleurs (r,g,b,a)
    local r1, g1, b1, a1 = color1[1], color1[2], color1[3], color1[4] or 1
    local r2, g2, b2, a2 = color2[1], color2[2], color2[3], color2[4] or 1
    
    -- Activer le canvas
    love.graphics.setCanvas(canvas)
    
    -- Direction du dégradé (horizontal par défaut, "vertical" pour vertical)
    direction = direction or "horizontal"
    
    -- Nombre d'étapes pour le dégradé
    local steps = math.max(width, height)
    
    for i = 0, steps do
        -- Calculer l'interpolation linéaire
        local t = i / steps
        local r = r1 + (r2 - r1) * t
        local g = g1 + (g2 - g1) * t
        local b = b1 + (b2 - b1) * t
        --local a = a1 + (a2 - a1) * t
        
        -- Définir la couleur
        love.graphics.setColor(r, g, b, 1)
        
        if direction == "horizontal" then
            -- Dessiner une ligne verticale
            love.graphics.line(i, 0, i, height)
        else
            -- Dessiner une ligne horizontale
            love.graphics.line(0, i, width, i)
        end
    end
    
    -- Réinitialiser le canvas et la couleur
    love.graphics.setCanvas()
    love.graphics.setColor(1, 1, 1, 1)
    
    return canvas
end