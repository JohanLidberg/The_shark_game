
function love.load()
    player = {}
    player.x = 400 
    player.y = 400
    player.speed = 200 
    a = 0 
    d = 0 
    w = 0 
    s = 0 
    end
    
    function love.update(dt)
        
    if love.keyboard.isDown("a") then
      player.x = player.x - player.speed*dt
         a = 1
         d = 0
         w = 0
         s = 0
    elseif love.keyboard.isDown("d") then
         player.x = player.x + player.speed*dt
         a = 0
         d = 1
         w = 0
         s = 0
    elseif love.keyboard.isDown("w") then
         player.y = player.y - player.speed*dt
         a = 0
         d = 0
         w = 1
         s = 0
    elseif love.keyboard.isDown("s") then
         player.y = player.y + player.speed*dt
         a = 0
         d = 0
         w = 0
         s = 1
    end 
end


    function love.draw()
         love.graphics.setColor(175, 25, 134, 255)
         love.graphics.rectangle("fill", player.x, player.y, 55, 55) 
        
    end

    


