function love.load()
    Object = require "classic"
    require "player"
    require "enemy"
    require "laser"
    
    player = Player()
    enemy = Enemy()
    listOfLasers = {}
    count = 0
end

function love.update(dt)
    player:update(dt)
    enemy:update(dt)

    for i,v in ipairs(listOfLasers) do
        v:update(dt)
        v:checkCollision(enemy)

        if v.dead then
            table.remove(listOfLasers, i)
            count = count + 1
        end
    end
end

function love.keypressed(key)
    player:keypressed(key)
end

function love.draw()
    player:draw()
    enemy:draw()
    for i,v in ipairs(listOfLasers) do
        v:draw()
    end
    love.graphics.print("score:"..count, 100)
end

