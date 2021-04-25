local Galaxy = require "galaxy"
local Player = require "player"
local Map = require "map"
local GameText = require "gametext"
require "conf"

function love.load()
  
  love.math.setRandomSeed(os.time() + love.mouse.getX())
  
  GameText.initialize()
  
  gr = love.graphics
  
  spaceFont = gr.newImageFont('src/outerfont.png', ' ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890!?.,"\'-()$:;@+=*%')
  smolFont = gr.newImageFont('src/smolfont.png', ' ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-"\'?.,')
  smolFontDark = gr.newImageFont('src/smolfontdark.png', ' ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-"\'?.,')
  planetSheet = gr.newImage("src/planetSheet.png")
  planetDetails = gr.newImage("src/planetDetails.png")
  galaxyRingsOuter = gr.newImage("src/galaxyRings1.png")
  galaxyRingsMiddle = gr.newImage("src/galaxyRings2.png")
  galaxyRingsInner = gr.newImage("src/galaxyRings3.png")
  
  galaxyMap = Map.new()
  arePlanetDetailsOpen = false
  openPlanet = nil
  
  intro = 1
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
  
  planetButton = {
    src = gr.newImage("src/planetAction.png"),
    x = 460,
    y = 496
  }
  
  galaxyButton = {
    src = gr.newImage("src/galaxyButton.png"),
    x = 90,
    y = 460
    }
  
  current = {
    src = gr.newImage("src/current.png"),
    x = 0,
    y = 392
  }
  
  
  
  player = Player.new()
  
  
  print(galaxyMap.layers[1][1].planets[2].name)
  print(galaxyMap.layers[1][1].planets[2].desc)
  
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
    
    gr.printf("Your name is 72H. You're a space adventurer, also known as a spaceventurer. (Unfortunately, you can't convince anyone else to call you a spaceventurer.) Your mission? Explore the furthest reaches of deep space! You must balance mining fuel, earning credits, and indulging your wanderlust.", 100, 200, 600, "center")
    gr.draw(arrowR.src, arrowR.x, arrowR.y)
  
  elseif intro == 3 then
  
    gr.printf("To 'play' the 'game' (aka pilot your spaceship), you must choose which galaxy to warp to, and then scan the  planets to find out more about them. From there, you can take available actions or move on to the next galaxy. An ending, you ask? Does SPACE have an ending? (No, it does not. Neither does this game. But it *does* have animated tutorial arrows, and handmade fonts!) Press the animated tutorial arrow to continue.", 100, 200, 600, "center")
    gr.draw(arrowR.src, arrowR.x, arrowR.y)
    gr.draw(arrowL.src, arrowL.x, arrowL.y)
    
  else
    
    --ACTUAL GAME STUFF GOES HERE
    
    --Topbar UI
    gr.draw(fuel, 30, 32)
    gr.setFont(smolFont)
    gr.draw(cred, 700, 22)
    gr.printf(player.credits, 750, 40, 100)
    gr.setFont(spaceFont)
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
      gr.draw(galaxyButton.src, galaxyButton.x, galaxyButton.y)
      gr.setFont(smolFontDark)
      gr.printf("LEAVE GALAXY", galaxyButton.x+8, galaxyButton.y+24, 232, "center")
      gr.setFont(spaceFont)
      gr.printf("The quick brown fox jumped over the lazy dog, wow wow wow! I can't believe this is working! How many characters can I generally fit into this thing? Even more than this? Let's keep going and adding even more characters, and add in some numbers too. $500 credits, please! \"NO WAY\" ", 50, 110, 300)
      
      --Galaxy
      
      positionPlanets(player.location.planets)
      
      if arePlanetDetailsOpen then 
        gr.setFont(smolFontDark)
        gr.draw(planetDetails, 420, 340)
        gr.draw(planetButton.src, planetButton.x, planetButton.y)
        gr.draw(planetSheet, openPlanet.src, 628, 500)
        gr.printf(openPlanet.name:upper(), 580, 350, 120)
        gr.printf(openPlanet.desc:upper(), 452, 386, 265)
        gr.setFont(smolFont)
        gr.printf(openPlanet.inter:upper(), planetButton.x + 4, planetButton.y + 10, 140, "center")
        gr.setFont(spaceFont)
        
      end
      
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
    
  elseif nav == false then
    
    if arePlanetDetailsOpen then
        
      if testOverlap(x, y, planetButton) then
        
        -- Todo: make sure that players can only do this once, prob add a flag on the action itself
        -- make it a table instead of a string
        
        player.credits = player.credits + 10
        
      end
        
    end
    
    
    for i=1, table.getn(player.location.planets) do
      if testOverlapPlanets(x, y, player.location.planets[i]) then
        if not arePlanetDetailsOpen then
          arePlanetDetailsOpen = true 
          openPlanet = player.location.planets[i]
        else
          arePlanetDetailsOpen = false
          openPlanet = nil
        end
      end
      
    end
    
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

function testOverlapPlanets(x, y, item)
  
  iw, ih = 64, 64
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


-- Todo: move the x and y declarations out into load or update if possible
function positionPlanets(planets)
  
  local n = table.getn(planets)
  
  if n == 2 then
    gr.draw(galaxyRingsMiddle, 450, 50)
    planets[1].x, planets[1].y = 480, 70
    planets[2].x, planets[2].y = 632, 190
    gr.draw(planetSheet, planets[1].src, planets[1].x, planets[1].y)
    gr.draw(planetSheet, planets[2].src, planets[2].x, planets[2].y)
  elseif n == 3 then
    gr.draw(galaxyRingsInner, 450, 50)
    gr.draw(galaxyRingsOuter, 450, 50)
    planets[1].x, planets[1].y = 460, 60
    planets[2].x, planets[2].y = 590, 200
    planets[3].x, planets[3].y = 660, 100
    gr.draw(planetSheet, planets[1].src, planets[1].x, planets[1].y)
    gr.draw(planetSheet, planets[2].src, planets[2].x, planets[2].y)
    gr.draw(planetSheet, planets[3].src, planets[3].x, planets[3].y)
  elseif n == 4 then
    gr.draw(galaxyRingsInner, 450, 50)
    gr.draw(galaxyRingsOuter, 450, 50)
    planets[1].x, planets[1].y = 490, 110
    planets[2].x, planets[2].y = 590, 200
    planets[3].x, planets[3].y = 660, 100
    planets[4].x, planets[4].y = 470, 240
    gr.draw(planetSheet, planets[1].src, planets[1].x, planets[1].y)
    gr.draw(planetSheet, planets[2].src, planets[2].x, planets[2].y)
    gr.draw(planetSheet, planets[3].src, planets[3].x, planets[3].y)
    gr.draw(planetSheet, planets[4].src, planets[4].x, planets[4].y)
  elseif n == 5 then
    gr.draw(galaxyRingsInner, 450, 50)
    gr.draw(galaxyRingsOuter, 450, 50)
    planets[1].x, planets[1].y = 460, 60
    planets[2].x, planets[2].y = 590, 200
    planets[3].x, planets[3].y = 660, 100
    planets[4].x, planets[4].y = 460, 240
    planets[5].x, planets[5].y = 550, 80
    gr.draw(planetSheet, planets[1].src, planets[1].x, planets[1].y)
    gr.draw(planetSheet, planets[2].src, planets[2].x, planets[2].y)
    gr.draw(planetSheet, planets[3].src, planets[3].x, planets[3].y)
    gr.draw(planetSheet, planets[4].src, planets[4].x, planets[4].y)
    gr.draw(planetSheet, planets[5].src, planets[5].x, planets[5].y)
  end
  
end


