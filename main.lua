local snake = require("snake")
local map = require("map")
local fruit = require("fruit")
local win_Size = love.graphics.getWidth()
local counter = 0
local updateTick = 10

function love.load()
    love.window.setPosition(640, 180)
    map.load(50, 50, win_Size)
    fruit.random_Point(map)
end

function love.update(dt)
    counter = counter + 1
    if counter % updateTick == 0 then
        --print(snake.x)
        --print(snake.y)
        --print(snake.cords[1])
        --print(snake.cords[2])
        snake.tick(map)
    end

    if snake.x == pos_X and snake.y == pos_Y then
        fruit.random_Point(map)
        snake.tail_length = snake.tail_length + 1
        table.insert(snake.tail, {0, 0})
    end

    if snake.x == snake.cords[1] and snake.y == snake.cords[2] then
        snake.restart()
        fruit.random_Point(map)
    end
end

function love.draw()
    snake.draw(map)
    fruit.draw(map)
    map.draw(snake)
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end

    if key == "w" or key == "up" and snake.dir_Y == 0 then
        snake.changeDir(0, -1)
    elseif key == "s" or key == "down" and snake.dir_Y == 0 then
        snake.changeDir(0, 1)
    elseif key == "a" or key == "left" and snake.dir_X == 0 then
        snake.changeDir(-1, 0)
    elseif key == "d" or key == "right" and snake.dir_X == 0 then
        snake.changeDir(1, 0)
    end
end
