

function love.load()

  world = love.physics.newWorld(0, 400)

  ball = {}
  ball.body = love.physics.newBody(world, 400, 200, "dynamic")
  ball.body:setMass(5)
  ball.shape = love.physics.newPolygonShape(0, 0, 0, 20, 40, 20, 40, 0)
  ball.fixture = love.physics.newFixture(ball.body, ball.shape)

  ball2 = {}
  ball2.body = love.physics.newBody(world, 400, 200, "dynamic")
  ball2.body:setMass(5)
  ball2.shape = love.physics.newPolygonShape(0, 0, 0, 20, 40, 20, 40, 0)
  ball2.fixture = love.physics.newFixture(ball2.body, ball2.shape)


  block = {}
  block.body = love.physics.newBody(world, 200, 450, 'static')
  block.shape = love.physics.newPolygonShape(0, 0, 0, 20, 400, 20, 400, 0)
  block.fixture = love.physics.newFixture(block.body, block.shape)

  block.sbody = love.physics.newBody(world, 200, 200, 'static')
  block.fshape = love.physics.newPolygonShape(0, 0, 0, 20, 400, 20, 400, 0)
  block.gfixture = love.physics.newFixture(block.sbody, block.fshape)


end

function love.update(dt)
  world:update(dt)

  if love.keyboard.isDown("d") then
    ball.body:applyForce(100, 0)
  elseif love.keyboard.isDown("a") then
    ball.body:applyForce(-100, 0)
  end
  if love.keyboard.isDown("w") then
    ball.body:applyForce(0, -1000)
  elseif love.keyboard.isDown("s") then
    ball.body:applyForce(0, 1000)
end

if love.keyboard.isDown("right") then
  ball2.body:applyForce(100, 0)
elseif love.keyboard.isDown("left") then
  ball2.body:applyForce(-100, 0)
end
if love.keyboard.isDown("up") then
  ball2.body:applyForce(0, -1000)
elseif love.keyboard.isDown("down") then
  ball2.body:applyForce(0, 1000)
end
end

function love.draw()
  love.graphics.setBackgroundColor{0, 0, 1, 1}

  love.graphics.setColor(0, 1, 0, 1)
  love.graphics.polygon('fill', ball.body:getWorldPoints(ball.shape:getPoints()))

  love.graphics.setColor(0, 1, 0, 1)
  love.graphics.polygon('fill', ball2.body:getWorldPoints(ball2.shape:getPoints()))

  love.graphics.setColor{0, 1, 1, 1}
  love.graphics.polygon('fill', block.body:getWorldPoints(block.shape:getPoints()))

  love.graphics.setColor{0, 1, 1, 1}
  love.graphics.polygon('fill', block.sbody:getWorldPoints(block.fshape:getPoints()))
  
end