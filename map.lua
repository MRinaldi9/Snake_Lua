local map = {}

map.matrix = {}

function map.load(rows, columns, win_size)
    map.cellSize = win_size / rows
    map.columns = columns
    map.rows = rows

    for i = 1, columns do
        map.matrix[i] = {}
        for j = 1, rows do
            map.matrix[i][j] = 0
        end
    end
end

function map.draw(snake)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.print("Collected fruits: " .. snake.tail_length, 10, 10, 0, 1.5, 1.5, 0, 0, 0, 0)
end

return map
