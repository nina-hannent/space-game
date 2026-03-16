function love.load()
    Object = require "classic"
    require "player"
    require "enemy"
    require "laser"
    require "obstacle"
    
    player = Player()
    enemy = Enemy()
    listOfLasers = {}
    listOfObstacles = {}
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

    for i,v in ipairs(listOfObstacles) do
        v:update(dt)
        v:checkHit(player)
        if v.dead then
           table.remove(listOfObstacles, i)
           love.load()
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

    for i,v in ipairs(listOfObstacles) do
        v:draw()
    end
    love.graphics.print("score:"..count, 100)
end

