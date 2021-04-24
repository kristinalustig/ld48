local Galaxy = require "galaxy"
local Player = require "player"
local Map = require "map"
require "conf"

function love.load()
  
  love.math.setRandomSeed(os.time() + love.mouse.getX())
  
  gr = love.graphics
  
  spaceFont = love.graphics.newImageFont('src/outerfont.png', ' ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890!?.,"\'-()$:;@+=*%')
  planetSheet = gr.newImage("src/planetSheet.png")
  galaxyRingsOuter = gr.newImage("src/galaxyRings1.png")
  galaxyRingsMiddle = gr.newImage("src/galaxyRings2.png")
  galaxyRingsInner = gr.newImage("src/galaxyRings3.png")
  
  galaxyMap = Map.new()
  
  intro = 0
  timer = 0
  nav = false
  reset = true
  
  cred = gr.newImage("src/cred.png")
  fuel = gr.newImage("src/fuel.png")
  textbox = gr.newImage("src/textbox.png")
  title = gr.newImage("src/title.png")
  start = {
    src = gr.newImage("src/start.png"),
    x = 240,
    y = 420
  }
  arrowR = {
    src1 = gr.newImage("src/arrowR1.png"),
    src2 = gr.newImage("src/arrowR2.png"),
    x = 700,
    y = 500
  }
  arrowR.src = arrowR.src1
  arrowL = {
    src1 = gr.newImage("src/arrowL1.png"),
    src2 = gr.newImage("src/arrowL2.png"),
    x = 36,
    y = 500
  }
  arrowL.src = arrowL.src1
  
  fuelFull = gr.newImage("src/fuelCellFull.png")
  fuelEmpty = gr.newImage("src/fuelCellEmpty.png")
  
  ship = {
    src = gr.newImage("src/ship.png"),
    x = 40, 
    y = 240,
    r = 0,
    ox = 0,
    oy = 0
  }
  
  current = {
    src = gr.newImage("src/current.png"),
    x = 0,
    y = 392
  }
  
  
  
  player = Player.new()
  
  
  print(galaxyMap.layers[1][1].planets[2].name)
  
  -- THIS IS FOR TESTING TO MAKE SURE GENERATION IS WORKING
  for i=1, table.getn(galaxyMap.layers) do
    for j=1, table.getn(galaxyMap.layers[i]) do
      for k=1, table.getn(galaxyMap.layers[i][j].planets) do
        local pname = galaxyMap.layers[i][j].planets[k].name
        -- print(pname)
      end
    end
  end
  
end

function love.update(dt)
  
  timer = timer + 1
  
  if intro == 2 then
    animArrow(arrowR)
  elseif intro == 3 then
    animArrow(arrowR)
    animArrow(arrowL)
  elseif nav == true then
    hoverShip()
  end
  
end

function love.draw()
  
  gr.setFont(spaceFont)
  
  
  -- HERE WE CAN PUT THE TUTORIAL!
  if intro == 1 then
    
    gr.draw(title, 0, 0)
    gr.draw(start.src, start.x, start.y)
    
  elseif intro == 2 then
    
    gr.printf("Here's a tutorial page to test it out.", 100, 200, 600, "center")
    gr.draw(arrowR.src, arrowR.x, arrowR.y)
  
  elseif intro == 3 then
  
    gr.printf("Here's a second tutorial page to test it out.", 100, 200, 600, "center")
    gr.draw(arrowR.src, arrowR.x, arrowR.y)
    gr.draw(arrowL.src, arrowL.x, arrowL.y)
    
  else
    
    --ACTUAL GAME STUFF GOES HERE
    
    --Topbar UI
    gr.draw(fuel, 30, 32)
    gr.draw(cred, 700, 22)
    gr.printf(player.credits, 750, 38, 100)
    for i=1, 5 do
      local f = fuelEmpty
      if player.fuel >= i then
        f = fuelFull
      end
      gr.draw(f, 100 + (45 * i), 32)
    end
    
    if nav then
    
      gr.draw(ship.src, ship.x, ship.y, ship.r, 1, 1, ship.ox, ship.oy)
      gr.draw(current.src, current.x, current.y)
      gr.printf(player.location.name, 36, 500, 180, "center")
      
    else
    
    --Text
    gr.draw(textbox, 30, 90)
    gr.printf("The quick brown fox jumped over the lazy dog, wow wow wow! I can't believe this is working! How many characters can I generally fit into this thing? Even more than this? Let's keep going and adding even more characters, and add in some numbers too. $500 credits, please! \"NO WAY\" ", 50, 110, 300)
    
    
    
    --Galaxy
    
    positionPlanets(player.location.planets)
--    for i=1, table.getn(player.location.planets) do
--      gr.draw(planetSheet, player.location.planets[i].image, 400 + (66*i), 400)
--    end
    
    
    --Planet
    -- gr.draw(planetSheet, player.currPlanet.image, 400, 400)
    
    end
    
    
  end
  
end

function love.mousepressed(x, y, button, istouch)
  
  if intro == 1 then
    
    if testOverlap(x, y, start) then intro = 2 end
    
  elseif intro == 2 then
    
    if testOverlap(x, y, arrowR) then intro = 3 end
    
  elseif intro == 3 then
    
    if testOverlap(x, y, arrowR) then intro = 0
      elseif testOverlap(x, y, arrowL) then intro = 2 end
    
  end
  
end

function testOverlap(x, y, item)
  
  iw, ih = item.src:getDimensions()
  ix, iy = item.x, item.y
  
  if x >= ix and y >= iy then
    if x <= ix+iw and y <= iy+ih then
      return true
    end
  end
  
  return false

end

function animArrow(a)
  
  if math.floor(timer) % 14 == 0 then 
    if a.src == a.src1 then 
      a.src = a.src2 else 
      a.src = a.src1 
    end 
  end
  
end

function hoverShip()

  if timer % 2 == 0 then
    if ship.oy <= 6 and reset == true then
      ship.oy = ship.oy + 1
    else
      if reset == true then 
        reset = false
      end
      ship.oy = ship.oy - 1
      if ship.oy <= 0 then 
        reset = true

        end
    end
  end

  
end

function positionPlanets(planets)
  
  local n = table.getn(planets)
  
  if n == 2 then
    gr.draw(galaxyRingsMiddle, 450, 150)
    gr.draw(planetSheet, planets[1].image, 480, 170)
    gr.draw(planetSheet, planets[2].image, 632, 290)
  elseif n == 3 then
    gr.draw(galaxyRingsInner, 450, 150)
    gr.draw(galaxyRingsOuter, 450, 150)
    gr.draw(planetSheet, planets[1].image, 460, 160)
    gr.draw(planetSheet, planets[2].image, 590, 300)
    gr.draw(planetSheet, planets[3].image, 660, 200)
    
  elseif n == 4 then
    gr.draw(galaxyRingsInner, 450, 150)
    gr.draw(galaxyRingsOuter, 450, 150)
    gr.draw(planetSheet, planets[1].image, 490, 210)
    gr.draw(planetSheet, planets[2].image, 590, 300)
    gr.draw(planetSheet, planets[3].image, 660, 200)
    gr.draw(planetSheet, planets[4].image, 470, 340)
  elseif n == 5 then
    gr.draw(galaxyRingsInner, 450, 150)
    gr.draw(galaxyRingsOuter, 450, 150)
    gr.draw(planetSheet, planets[1].image, 460, 160)
    gr.draw(planetSheet, planets[2].image, 590, 300)
    gr.draw(planetSheet, planets[3].image, 660, 200)
    gr.draw(planetSheet, planets[4].image, 460, 340)
    gr.draw(planetSheet, planets[5].image, 550, 180)

  end
  
end


