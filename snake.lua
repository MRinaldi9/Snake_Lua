local snake = {}

snake.x = 25
snake.y = 25

snake.dir_x = 0
snake.dir_y = 0
snake.tail_length = 0
snake.tail = {}
snake.cords = {}

function snake.changeDir(new_x, new_y)
    snake.dir_x = new_x
    snake.dir_y = new_y
end

function snake.tick(map)
    old_x = snake.x
    old_y = snake.y

    snake.x = snake.x + snake.dir_x
    snake.y = snake.y + snake.dir_y

    if snake.x > map.rows - 1 then
        snake.x = 0
    elseif snake.x < 0 then
        snake.x = map.rows - 1
    elseif snake.y > map.columns - 1 then
        snake.y = 0
    elseif snake.y < 0 then
        snake.y = map.columns - 1
    end

    if snake.tail_length > 0 then
        for _, cords in ipairs(snake.tail) do
            --print(cords[1],cords[2])
            snake.cords = cords
            --print(snake.cords[1])
            local body_X, body_Y = cords[1], cords[2]
            cords[1], cords[2] = old_x, old_y
            old_x, old_y = body_X, body_Y
        end
    end
end

function snake.draw(map)
    love.graphics.setColor(1, 0, 0) --Head Snake Color
    love.graphics.rectangle("fill", snake.x * map.cellSize, snake.y * map.cellSize, map.cellSize, map.cellSize, 5, 5) -- Snake body

    love.graphics.setColor(0.5, 0, 0)
    for _, value in ipairs(snake.tail) do
        love.graphics.rectangle(
            "fill",
            value[1] * map.cellSize,
            value[2] * map.cellSize,
            map.cellSize - 2,
            map.cellSize - 2,
            5,
            5
        )
    end
end

function snake.restart()
    snake.x = 25
    snake.y = 25
    snake.dir_x = 0
    snake.dir_y = 0
    snake.tail = {}
    snake.tail_length = 0
end
return snake
