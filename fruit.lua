local fruit = {}

pos_X = 0
pos_Y = 0

function fruit.random_Point(map)
    math.randomseed(os.time())
    pos_X = math.random(map.rows - 1)
    pos_Y = love.math.random(map.columns - 1)
end

function fruit.draw(map)
    love.graphics.setColor(0, 1, 0)
    love.graphics.rectangle("fill", pos_X * map.cellSize, pos_Y * map.cellSize, map.cellSize, map.cellSize, 20, 20)
end

return fruit
