Obstacle = Object:extend()

function Obstacle:new(x, y)
    self.image = love.graphics.newImage("assets/laserBlue.png")
    self.x = x
    self.y = y
    self.speed = 300
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
end

function Obstacle:update(dt)
    self.y = self.y - self.speed * dt
end

function Obstacle:draw()
    love.graphics.draw(self.image, self.x, self.y)
end

function Obstacle:checkHit(obj)
    local self_left = self.x
    local self_right = self.x + self.width
    local self_top = self.y
    local self_bottom = self.y + self.height

    local obj_left = obj.x
    local obj_right = obj.x + obj.width
    local obj_top = obj.y
    local obj_bottom = obj.y + obj.height


    if  self_right > obj_left
    and self_left < obj_right
    and self_bottom > obj_top
    and self_top < obj_bottom then
        self.dead = true
    end
end