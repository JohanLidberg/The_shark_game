local backgroundmusic = love.audio.newSource("underSea.wav", "stream")
backgroundmusic:play()

require "collission"
function love.keypressed(k)
  if k == 'r' then
    love.event.quit( "restart" )
  end
  if k == "escape" then
    love.event.quit("quit")
  end

end
function love.load()
  math.random(os.time())

  image = love.graphics.newImage("pictures/background3.png")

  player = {}
  player.x = 100
  player.y = 100
  player.width = 200
  player.height = 100
  player.image = love.graphics.newImage("pictures/sharkcartoonplayer1.png")

  score = 0
  myFont = love.graphics.newFont(40)

  player2 = {}
  player2.x = 500
  player2.y = 100
  player2.width = 200
  player2.height = 100
  player2.image = love.graphics.newImage("pictures/sharkcartoon.png")

  player2score = 0
  player2myFont = love.graphics.newFont(40)

  lava = {}
  lava.x = 400
  lava.y = 300
  lava.width = 30
  lava.height = 30
  lava.image = love.graphics.newImage("pictures/smallfish.png")

  lava4 = {}
  lava4.x = 300
  lava4.y = 400
  lava4.width = 30
  lava4.height = 30
  lava4.image = love.graphics.newImage("pictures/smallfish.png")

  lava2 = {}
  lava2.x = 300
  lava2.y = 400
  lava2.width = 30
  lava2.height = 30
  lava4.image = love.graphics.newImage("pictures/smallfish.png")

  lava = {}
  lava.x = 400
  lava.y = 300
  lava.width = 30
  lava.height = 30
  lava.image = love.graphics.newImage("pictures/smallfish.png")

  lava4 = {}
  lava4.x = 300
  lava4.y = 400
  lava4.width = 30
  lava4.height = 30
  lava4.image = love.graphics.newImage("pictures/smallfish.png")

  lava2 = {}
  lava2.x = 300
  lava2.y = 400
  lava2.width = 30
  lava2.height = 30
  lava2.image = love.graphics.newImage("pictures/smallfish.png") 
end

function love.update(dt)
  if love.keyboard.isDown("d") then
    player.x = player.x + 10
  elseif love.keyboard.isDown("a") then
    player.x = player.x - 10
  elseif love.keyboard.isDown("s") then
    player.y = player.y + 10
  elseif love.keyboard.isDown("w") then
   player.y = player.y - 10
  end
  

  if love.keyboard.isDown("right") then
    player2.x = player2.x + 10
  elseif love.keyboard.isDown("left") then
    player2.x = player2.x - 10
  elseif love.keyboard.isDown("down") then
    player2.y = player2.y + 10
  elseif love.keyboard.isDown("up") then
   player2.y = player2.y - 10
  end


if AABB(player.x, player.y, player.width, player.height, lava.x, lava.y, lava.width, lava.height) then
  lava.x = math.random(0, 800 - lava.width)
  lava.y = math.random(0, 600 - lava.height)
  score = score + 1

end
if AABB(player.x, player.y, player.width, player.height,lava4.x, lava4.y, lava4.width, lava4.height) then
  lava4.x = math.random(0, 800 - lava4.width)
  lava4.y = math.random(0, 600 - lava4.height)
  score = score + 1
end
if AABB(player.x, player.y, player.width, player.height, lava2.x, lava2.y, lava2.width, lava2.height) then
  lava2.x = math.random(0, 800 - lava2.width)
  lava2.y = math.random(0, 600 - lava2.height)
  score = score + 1
end

  if score == 21 then
  love.window.showMessageBox("Victory", "Green shark won!, press ok to restart", "info")
  love.load()
end
if AABB(player2.x, player2.y, player2.width, player2.height, lava.x, lava.y, lava.width, lava.height) then
  lava.x = math.random(0, 800 - lava.width)
  lava.y = math.random(0, 600 - lava.height)
  player2score = player2score + 1

end
if AABB(player2.x, player2.y, player2.width, player2.height,lava4.x, lava4.y, lava4.width, lava4.height) then
  lava4.x = math.random(0, 800 - lava4.width)
  lava4.y = math.random(0, 600 - lava4.height)
  player2score = player2score + 1
end
if AABB(player2.x, player2.y, player2.width, player2.height, lava2.x, lava2.y, lava2.width, lava2.height) then
  lava2.x = math.random(0, 800 - lava2.width)
  lava2.y = math.random(0, 600 - lava2.height)
  player2score = player2score + 1
end
if player2score == 21 then
  love.window.showMessageBox("Victory", "Blue shark won!, press ok to restart", "info")
  love.load()
end
end 

function love.draw()
  love.graphics.draw(image, background)

  love.graphics.draw(player.image, player.x, player.y)

  love.graphics.draw(player2.image, player2.x, player2.y)

  love.graphics.draw(lava.image, lava.x, lava.y)
  love.graphics.draw(lava4.image, lava4.x, lava4.y)
  love.graphics.draw(lava2.image, lava2.x, lava2.y)


  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.setFont(myFont)
  love.graphics.print(score, 20, 10)

  love.graphics.setFont(player2myFont)
  love.graphics.print(player2score, 750, 10)
end