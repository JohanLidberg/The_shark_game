

function love.load()
  
end

function love.update(dt)

end

function love.keypressed(key)
  if key == "escape" then
    love.event.push("quit")
  end
end 

function love.draw(dt)
  
end
     function love.load()
    
          world = love.physics.newWorld(0, 400, true) 
          ball = {}
          ball.b = love.physics.newBody(world, 400, 200, "dynamic") 
          ball.b:setMass(1)                                   
          ball.s = love.physics.newCircleShape(20)                 
          ball.f = love.physics.newFixture(ball.b, ball.s)          
          ball.f:setRestitution(0)                              
          ball.f:setUserData("Ball")                               
      static = {}
          static.b = love.physics.newBody(world, 400, 500, "static")
          static.s = love.physics.newRectangleShape(200, 50)         
          static.f = love.physics.newFixture(static.b, static.s)
          static.f:setUserData("Block")
       
          static.a = love.physics.newBody(world, 100, 500, "static")
          static.c = love.physics.newRectangleShape(200, 50)         
          static.q = love.physics.newFixture(static.a, static.c)
          static.f:setUserData("Block")

          static.y = love.physics.newBody(world, 250, 300, "static")
          static.t = love.physics.newRectangleShape(200, 50)         
          static.i = love.physics.newFixture(static.y, static.t)
          static.f:setUserData("Block")
  end
      
     function love.update(dt)
               world:update(dt)
            
               if love.keyboard.isDown("d") then
                   ball.b:applyForce(100, 0) 
               elseif love.keyboard.isDown("a") then
                   ball.b:applyForce(-100, 0) 
               end
               if love.keyboard.isDown("w") then
                   ball.b:applyForce(100, -1000)
               elseif love.keyboard.isDown("s") then
                   ball.b:applyForce(0, 1000)
               end
               
     end
     
     function love.draw()
        love.graphics.setBackgroundColor{0, 0, 1, 1}

        love.graphics.setColor(1 ,1 , 1)
        love.graphics.circle("fill", ball.b:getX(),ball.b:getY(), ball.s:getRadius(),20 )

        love.graphics.setColor{0, 1, 0, 1}
        love.graphics.polygon("fill", static.b:getWorldPoints(static.s:getPoints()))

         love.graphics.setColor{0, 1, 0, 1}
         love.graphics.polygon("fill", static.a:getWorldPoints(static.c:getPoints()))
         
         love.graphics.setColor{0, 1, 0, 1}
         love.graphics.polygon("fill", static.y:getWorldPoints(static.t:getPoints()))
     end
    

          
        
   