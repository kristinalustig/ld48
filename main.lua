local Galaxy = require "galaxy"
local Player = require "player"
local Map = require "map"
local GameText = require "gametext"
require "conf"

function love.load()
  
  love.math.setRandomSeed(os.time() + love.mouse.getX())
  
  GameText.initialize()
  
  gr = love.graphics
  
  beep = love.audio.newSource("src/beep.mp3", "static")
  boop = love.audio.newSource("src/boop.mp3", "static")
  planets = love.audio.newSource("src/ethereal.wav", "static")
  galaxy = love.audio.newSource("src/chill.wav", "static")
  planets:setLooping(true)
  beep:setLooping(false)
  boop:setLooping(false)
  
  
  -- Static assets and fonts (non-interactive)
  spaceFont = gr.newImageFont('src/outerfont.png', ' ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890!?.,"\'-()$:;@+=*%')
  smolFont = gr.newImageFont('src/smolfont.png', ' ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-"\'?.,abcdefghijklmnopqrstuvwxyz!@()*+=%')
  smolFontDark = gr.newImageFont('src/smolfontdark.png', ' ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-"\'?.,abcdefghijklmnopqrstuvwxyz!@()*+=%')
  planetSheet = gr.newImage("src/planetSheet.png")
  planetDetails = gr.newImage("src/planetDetails.png")
  galaxyRingsOuter = gr.newImage("src/galaxyRings1.png")
  galaxyRingsMiddle = gr.newImage("src/galaxyRings2.png")
  galaxyRingsInner = gr.newImage("src/galaxyRings3.png")
  galaxySheet = gr.newImage("src/galaxySheet.png")
  galaxyDetails = gr.newImage("src/galaxyDetails.png")
  moneyDetail = gr.newImage("src/moneyDetail.png")
  scienceDetail = gr.newImage("src/scienceDetail.png")
  mysteryDetail = gr.newImage("src/mysteryDetail.png")
  fuelDetail = gr.newImage("src/fuelDetail.png")
  modal = gr.newImage("src/modal.png")
  cred = gr.newImage("src/cred.png")
  fuel = gr.newImage("src/fuel.png")
  textbox = gr.newImage("src/textbox.png")
  title = gr.newImage("src/title.png")
  fuelFull = gr.newImage("src/fuelCellFull.png")
  fuelEmpty = gr.newImage("src/fuelCellEmpty.png")
  statSheet = gr.newImage("src/statsheet.png")
  
  bg = {
    src1 = gr.newImage("src/titlebgstars1.png"),
    src2 = gr.newImage("src/titlebgstars2.png"),
    src3 = gr.newImage("src/titlebgstars3.png"),
    src4 = gr.newImage("src/titlebgstars4.png")
  }
  bg.curr = bg.src1
  
  --important global variables
  galaxyMap = Map.new()
  arePlanetDetailsOpen = false
  areGalaxyDetailsOpen = false
  openPlanet = nil
  openGalaxy = nil
  isModalOpen = false
  firstTimeWarp = true
  areStatsOpen = false
  gameOver = false
  canCheckCursor = false
  
  
  tooMuchFuel = "You're already maxed out on fuel!"
  notEnoughFuel = "You can't sell fuel that you don't have."
  notEnoughCreds = "You're gonna buy that, huh? With what money?"
  
  
  intro = 1
  timer = 0
  nav = false
  reset = true
  
  gameScore = 0
  
  
  
  --button tables and other interactive/animated elements
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
  
  warpButton = {
    src = gr.newImage("src/warpButton.png"),
    x = 410,
    y = 370
    }
  
  current = {
    src = gr.newImage("src/current.png"),
    x = 0,
    y = 392
  }
  
  modalYes = {
    src = gr.newImage("src/modalYes.png"),
    x = 200,
    y = 360
  }
  
  modalNo = {
    src = gr.newImage("src/modalNo.png"),
    x = 420,
    y = 360
  }
  
  statLink = {
    src = gr.newImage("src/statlink.png"),
    x = 440,
    y = 12
  }
  
  actionOk = {
    src = gr.newImage("src/actionOk.png"),
    x = 280,
    y = 340
  }
  
  scanner = love.mouse.newCursor("src/scanner.png", 20, 20)
  
  
  player = Player.new()
  
  planets:play()

end

function love.update(dt)
  
  timer = timer + 1
  
  if intro == 2 then
    animArrow(arrowR)
  elseif intro == 3 or intro == 4 then
    animArrow(arrowR)
    animArrow(arrowL)
  elseif nav == true then
    hoverShip()
  end
  
  if player.fuel < 0 or gameOver then
    canCheckCursor = false
    gameOver = true
    
    gameScore = (player.credits + (player.fuel * 5) + (player.researched * 3) + (player.currentLayer * 4))
    
  end

  
  
end

function love.draw()
  
  gr.setFont(spaceFont)
  
  if gameOver then
    animateSpace()
    gr.draw(bg.curr, 0, 0, 0, 1, -1, 0, 600)
    
    if player.currentLayer == galaxyMap.layerNum then
      
      gr.printf("Well, you did it. You reached the last level. Honestly, I wasn't sure if anyone would be able to do it, because I had no time to properly tune and balance the game. If you want to keep going, you can edit 'layerNum' in the map.lua file and it'll probably work.", 100, 100, 600, "center")
      
    else
      
      gr.printf("Welp, you ran out of fuel. That's okay, it happens. In fact, it happens so much that I had a hard time testing the actual ending of the game.", 100, 100, 600, "center")
      
    end
    
    gr.printf("To play again, you're going to have to close the game and restart. Thank you so much for playing! If you want, you can follow me on Twitter at @kristinalustig. Or, y'know, not. Whatever you'd like.", 100, 250, 600, "center")
    
    gr.printf("YOUR SCORE: " .. gameScore, 0, 400, 800, "center")
    gr.printf("Your score is your credits + (leftover fuel * 5) + (ship upgrades * 3) + (light years reached * 4). Quite arbitrarily. Go forth and min-max to your heart's delight.", 100, 450, 600, "center")
    
    
    return
  end
  
  
  -- HERE WE CAN PUT THE TUTORIAL!
  if intro == 1 then
    
    gr.setFont(smolFont)
    gr.draw(title, 0, 0)
    animateSpace()
    gr.draw(bg.curr, 0, 0)
    gr.draw(start.src, start.x, start.y)
    gr.printf("A Ludum Dare 48 compo entry by kristinamay", 0, 550, 800, "center")
    gr.setFont(spaceFont)
    
    
    
  elseif intro == 2 then
    
    gr.printf("Your name is 72H, but your friends call you Sev. \n \n You're a space adventurer, also known as a spaceventurer. (Unfortunately, you can't convince anyone else to call you a spaceventurer.) Your mission? Explore the furthest reaches of deep space with your trusty scanner, Gert! You must balance mining fuel, earning credits, researching ship improvements, and indulging your wanderlust. \n \n ...also, getting people to call you a spaceventurer.", 100, 150, 600, "center")
    gr.draw(arrowR.src, arrowR.x, arrowR.y)
  
  elseif intro == 3 then
  
    gr.printf("To 'play' the 'game' (aka pilot your spaceship), you must choose which solar system to warp to (you can scan them first!), and then scan the planets to find out more about them. From there, you can take the available action on a given planet (sometimes for a cost), or move on to the next system. \n \n An ending, you ask? Does SPACE have an ending? (No, it does not. Neither does this game. But it *does* have animated tutorial arrows, and handmade fonts!) \n \n Press the animated tutorial arrow to continue.", 100, 100, 600, "center")
    gr.draw(arrowR.src, arrowR.x, arrowR.y)
    gr.draw(arrowL.src, arrowL.x, arrowL.y)
    
  elseif intro == 4 then
  
    gr.printf("As you delve further into space (which is helpfully sorted into galaxies), keep in mind: you can only visit one solar system per galaxy. That's because you're not the best-behaved spaceventurer out there, and if you stick around in one place too long, beings start asking questions. It's best to keep moving. \n \nSo, if you're ready, and you're eager to explore the depths of uncharted space, let's GO!", 100, 150, 600, "center")
    gr.draw(arrowR.src, arrowR.x, arrowR.y)
    gr.draw(arrowL.src, arrowL.x, arrowL.y)
    
  else
    
    animateSpace()
    gr.draw(bg.curr, 0, 0, 0, 1, -1, 0, 600)
    
    --Topbar UI
    gr.draw(fuel, 30, 12)
    gr.setFont(smolFont)
    gr.draw(cred, 700, 2)
    gr.printf(player.credits, 750, 20, 100)
    
    
    for i=1, 5 do
      local f = fuelEmpty
      if player.fuel >= i then
        f = fuelFull
      end
      gr.draw(f, 100 + (45 * i), 12)
    end
    
    gr.printf(tonumber(string.format("%.1f", player.fuel)) .. "U", 376, 25, 100)
    
    gr.setFont(spaceFont)
    
    gr.draw(statLink.src, statLink.x, statLink.y)
    
    if nav then
    
      gr.draw(ship.src, ship.x, ship.y, ship.r, 1, 1, ship.ox, ship.oy)
      gr.draw(current.src, current.x, current.y)
      gr.printf("Return to " .. player.location.name, 36, 485, 180, "center")
      local locString = "You are currently " .. player.currentLayer
      if player.currentLayer == 1 then
        locString = locString .. " light year away from home."
      else
        locString = locString .. " light years away from home."
      end
      gr.setFont(smolFont)
      gr.printf(locString, 300, 550, 240)
      gr.setFont(spaceFont)
      
      if player.currentLayer < galaxyMap.layerNum then
        positionGalaxies(galaxyMap.layers[player.currentLayer + 1])
      end
      
      if areGalaxyDetailsOpen then
        gr.setFont(smolFont)
        gr.draw(galaxyDetails, 300, 300)
        gr.printf(openGalaxy.name, 410, 315, 120)
        
        local gt = nil
        
        if openGalaxy.galaxyType == "fuel" then
          gt = fuelDetail
        elseif openGalaxy.galaxyType == "ore" then
          gt = moneyDetail
        elseif openGalaxy.galaxyType == "research" then
          gt = scienceDetail
        elseif openGalaxy.galaxyType == "random" then
          gt = mysteryDetail
        end
        
        gr.draw(gt, 312, 346)
        
        gr.printf(openGalaxy.numPlanets .. " Planets", 416, 352, 120)
        gr.draw(warpButton.src, warpButton.x, warpButton.y)
        
        if isWarpModalOpen then
          gr.draw(modal, 0, 0)
          gr.setFont(smolFontDark)
          gr.printf("Just so you know, once you pick a system to warp to in this galaxy, you can't come back. Choose wisely!", 200, 200, 400, "center")
          gr.draw(warpButton.src, warpButton.x, warpButton.y)
          gr.setFont(spaceFont)
        end
        
        
      end
      
    else
    
      --Text
      gr.draw(textbox, 30, 90)
      gr.draw(galaxyButton.src, galaxyButton.x, galaxyButton.y)
      gr.setFont(smolFontDark)
      gr.printf("Leave Galaxy", galaxyButton.x+8, galaxyButton.y+24, 232, "center")
      gr.setFont(spaceFont)
      gr.printf(player.location.desc, 50, 110, 300)
      gr.setFont(spaceFont)
      
      --Galaxy
      
      positionPlanets(player.location.planets)
      
      if arePlanetDetailsOpen then 
        gr.setFont(smolFontDark)
        gr.draw(planetDetails, 420, 340)
        gr.draw(planetButton.src, planetButton.x, planetButton.y)
        gr.draw(planetSheet, openPlanet.src, 628, 500)
        gr.printf(openPlanet.name, 580, 350, 120)
        gr.printf(openPlanet.desc, 452, 386, 260)
        gr.setFont(smolFont)
        local buttonLabel = ""
        if openPlanet.actionTaken then 
          buttonLabel = "DONE" 
          gr.setFont(smolFontDark)
        else 
          buttonLabel = openPlanet.inter[1] end
        gr.printf(buttonLabel, planetButton.x + 4, planetButton.y + 15, 140, "center")
        gr.setFont(spaceFont)
        
      end
      
      if isModalOpen then
        gr.draw(modal, 0, 0)
        gr.setFont(smolFontDark)
        if openPlanet.actionTaken then
          gr.printf(openPlanet.actionResult, 200, 200, 400, "center")
          gr.draw(actionOk.src, actionOk.x, actionOk.y)
          gr.printf("OKAY", actionOk.x + 100, actionOk.y + 24, 100)
        else
          gr.printf(openPlanet.inter[4], 200, 200, 400, "center")
          gr.draw(modalYes.src, modalYes.x, modalYes.y)
          gr.draw(modalNo.src, modalNo.x, modalNo.y)
        end
        gr.setFont(spaceFont)
      end
      
      
    end
    
    canCheckCursor = true
    
    
  end
  
  if areStatsOpen then
    gr.setFont(smolFont)
    gr.draw(statSheet, 390, 50)
    local burn = tonumber(string.format("%.1f", player.fuelBurnRate)) .. " used per jump"
    local earn = tonumber(string.format("%.1f", player.fuelEarnRate)) .. "x drill mult."
    local cred = tonumber(string.format("%.1f", player.moneyEarnRate*100)) .. "% fuel sale mult."
    local disc = tonumber(string.format("%.1f", player.tradeDiscount*100)) .. "% off purchases"
    gr.printf(burn, 542, 70, 90)
    gr.printf(earn, 542, 130, 90)
    gr.printf(cred, 542, 190, 90)
    gr.printf(disc, 542, 250, 90)
    gr.setFont(spaceFont)
    
  end
  
  
end

function love.mousemoved(x, y, dx, dy, istouch)
  
  if not canCheckCursor then return end
  if not areStatsOpen and (intro < 1 or intro > 4) then
    if nav then
      for i=1, table.getn(galaxyMap.layers[player.currentLayer + 1]) do
        if testOverlapGals(x, y, galaxyMap.layers[player.currentLayer + 1][i]) then
          love.mouse.setCursor(scanner)
          return
        end
      end
      love.mouse.setCursor()
    else
      for i=1, table.getn(player.location.planets) do
        if testOverlapPlanets(x, y, player.location.planets[i]) then
          love.mouse.setCursor(scanner)
          return
        end
      end 
      love.mouse.setCursor()
    end
  else
    love.mouse.setCursor()
  end

end


function love.mousepressed(x, y, button, istouch)
  
  if gameOver then return end
  
  if isWarpModalOpen then
    if not testOverlap(x, y, warpButton) then
      isWarpModalOpen = false
      firstTimeWarp = false
      return
    end
  end
  
  if intro == 1 then
    
    if testOverlap(x, y, start) then intro = 2 end
    boop:play()
    
  elseif intro == 2 then
    
    if testOverlap(x, y, arrowR) then intro = 3 end
    boop:play()
    
  elseif intro == 3 or intro == 4 then
    
    if testOverlap(x, y, arrowR) then intro = intro + 1
  elseif testOverlap(x, y, arrowL) then intro = intro - 1 
    end
  boop:play()
    
  elseif nav == true then
    
    if testOverlap(x, y, current) then
      boop:play()
      nav = false
      return
    end
    
    
    if areGalaxyDetailsOpen then
      if testOverlap(x, y, warpButton) then
        if firstTimeWarp then
          boop:play()
          isWarpModalOpen = true
          firstTimeWarp = false
          return
        else
          boop:play()
          nav = false
          player.currentLayer = player.currentLayer + 1
          player.fuel = player.fuel - player.fuelBurnRate
          player.location = openGalaxy
          openGalaxy = nil
          areGalaxyDetailsOpen = false
          firstTimeWarp = false
          isWarpModalOpen = false
          return
        end
        
      end
    end
    
    
    for i=1, table.getn(galaxyMap.layers[player.currentLayer + 1]) do
      if testOverlapGals(x, y, galaxyMap.layers[player.currentLayer + 1][i]) then
        if not areGalaxyDetailsOpen then
          beep:play()
          areGalaxyDetailsOpen = true
          openGalaxy = galaxyMap.layers[player.currentLayer + 1][i]
        elseif areGalaxyDetailsOpen and openGalaxy ~= galaxyMap.layers[player.currentLayer + 1][i] then
          beep:play()
          openGalaxy = galaxyMap.layers[player.currentLayer + 1][i]
        else
          areGalaxyDetailsOpen = false
          openGalaxy = nil
        end
      end
    end
    
  elseif nav == false then
    
    if arePlanetDetailsOpen then
      
      if isModalOpen then
        
        if testOverlap(x, y, actionOk) and openPlanet.actionTaken then
          boop:play()
          isModalOpen = false
          return
        end
        
        if testOverlap(x, y, modalYes) then
          boop:play()
          
          executeAction()
          openPlanet.actionTaken = true
          return
          
        elseif testOverlap(x, y, modalNo) then
          boop:play()
          isModalOpen = false
          return
        end
        
          
      end
        
        
      if testOverlap(x, y, planetButton) and not openPlanet.actionTaken then
        boop:play()
        isModalOpen = true
        return
        
      end
        
    end
    
    if testOverlap(x, y, galaxyButton) then
      boop:play()
      if player.currentLayer == galaxyMap.layerNum then gameOver = true return end
      nav = true
      openPlanet = nil
      arePlanetDetailsOpen = false
    end
    
    
    for i=1, table.getn(player.location.planets) do
      if testOverlapPlanets(x, y, player.location.planets[i]) then
        if not arePlanetDetailsOpen then
          beep:play()
          arePlanetDetailsOpen = true 
          openPlanet = player.location.planets[i]
        elseif arePlanetDetailsOpen and openPlanet ~= player.location.planets[i] then
          beep:play()
          openPlanet = player.location.planets[i]
        else
          arePlanetDetailsOpen = false
          openPlanet = nil
        end
      end
      
    end
    
  end
  
  if testOverlap(x, y, statLink) then
    if areStatsOpen then
      areStatsOpen = false
    else
      boop:play()
      areStatsOpen = true
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

function testOverlapGals(x, y, item)
  iw, ih = 192, 192
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
    gr.draw(planetSheet, planets[1].src, planets[1].x, planets[1].y, .1)
    gr.draw(planetSheet, planets[2].src, planets[2].x, planets[2].y)
  elseif n == 3 then
    gr.draw(galaxyRingsInner, 450, 50)
    gr.draw(galaxyRingsOuter, 450, 50)
    planets[1].x, planets[1].y = 460, 60
    planets[2].x, planets[2].y = 590, 200
    planets[3].x, planets[3].y = 660, 100
    gr.draw(planetSheet, planets[1].src, planets[1].x, planets[1].y)
    gr.draw(planetSheet, planets[2].src, planets[2].x, planets[2].y, .1)
    gr.draw(planetSheet, planets[3].src, planets[3].x, planets[3].y, .2)
  elseif n == 4 then
    gr.draw(galaxyRingsInner, 450, 50)
    gr.draw(galaxyRingsOuter, 450, 50)
    planets[1].x, planets[1].y = 490, 110
    planets[2].x, planets[2].y = 590, 200
    planets[3].x, planets[3].y = 660, 100
    planets[4].x, planets[4].y = 470, 240
    gr.draw(planetSheet, planets[1].src, planets[1].x, planets[1].y)
    gr.draw(planetSheet, planets[2].src, planets[2].x, planets[2].y, .1)
    gr.draw(planetSheet, planets[3].src, planets[3].x, planets[3].y, .2)
    gr.draw(planetSheet, planets[4].src, planets[4].x, planets[4].y, .3)
  elseif n == 5 then
    gr.draw(galaxyRingsInner, 450, 50)
    gr.draw(galaxyRingsOuter, 450, 50)
    planets[1].x, planets[1].y = 460, 60
    planets[2].x, planets[2].y = 590, 200
    planets[3].x, planets[3].y = 660, 100
    planets[4].x, planets[4].y = 460, 240
    planets[5].x, planets[5].y = 550, 80
    gr.draw(planetSheet, planets[1].src, planets[1].x, planets[1].y)
    gr.draw(planetSheet, planets[2].src, planets[2].x, planets[2].y, .1)
    gr.draw(planetSheet, planets[3].src, planets[3].x, planets[3].y, .2)
    gr.draw(planetSheet, planets[4].src, planets[4].x, planets[4].y, .3)
    gr.draw(planetSheet, planets[5].src, planets[5].x, planets[5].y, .4)
  end
  
end

function positionGalaxies(gals)
  
  local n = table.getn(gals)
  
  if n == 2 then
    gals[1].x, gals[1].y = 400, 100
    gals[2].x, gals[2].y = 560, 250
  elseif n >= 3 then
    gals[1].x, gals[1].y = 400, 100
    gals[2].x, gals[2].y = 580, 200
    gals[3].x, gals[3].y = 580, 400
  end
  
  for i=1, n do
    gr.draw(galaxySheet, gals[i].src, gals[i].x, gals[i].y)
  end
  
end

function executeAction()
  
  local stat = openPlanet.inter[2]
  local change = openPlanet.inter[3]
  local purchase = openPlanet.inter[5]
  openPlanet.actionResult = openPlanet.inter[6]
  
  -- fuel is mined
  if stat == "fuel" then
    local success = checkMaxFuel()
    if success then 
      player.fuel = player.fuel + (change * player.fuelEarnRate)
    else
      openPlanet.actionResult = tooMuchFuel
    end
    
  -- an amount of fuel is purchased or sold
  elseif stat == "fuelTransaction" then
  local success = false
    if change < 0 then
      success = checkMinFuel(change)
    else
      success = checkMaxFuel() and checkMinCreds(purchase  * (1 - player.tradeDiscount))
    end
    
    if success then
      player.fuel = player.fuel + change
      if player.fuel > 5 then player.fuel = 5 end
      player.credits = player.credits + (purchase  * (1 - player.tradeDiscount))
    else
      openPlanet.actionResult = "You either don't have enough fuel to sell, or you don't have enough credits to buy. You may also be maxed out on fuel. In any case, something didn't work."
    end
  
  -- some amount of money is earned or given
  elseif stat == "credits" then
    player.credits = player.credits + change
    
   -- research upgrades below 
   
   -- fuel is burned at a slower rate between systems
  elseif stat == "fuelBurnRate" then
    
    local success = checkMinCreds(purchase * (1 - player.tradeDiscount))
    if success then
      player.fuelBurnRate = player.fuelBurnRate + change
      if player.fuelBurnRate <= 0 then
        player.fuelBurnRate = .01 end
      player.researched = player.researched + 1
      player.credits = player.credits + (purchase * (1 - player.tradeDiscount))
    else
      openPlanet.actionResult = notEnoughCreds
    end
    
  -- fuel is mined at a faster rate  
elseif stat == "fuelEarnRate" then
  
    local success = checkMinCreds(purchase  * (1 - player.tradeDiscount))
    if success then
      
      player.fuelEarnRate = player.fuelEarnRate + change
      player.researched = player.researched + 1
      player.credits = player.credits + (purchase  * (1 - player.tradeDiscount))
    else
      openPlanet.actionResult = notEnoughCreds
    end
    
    
  -- money is earned at a faster rate  
  elseif stat == "moneyEarnRate" then  
    
    local success = checkMinCreds(purchase * (1 - player.tradeDiscount))
    if success then
      player.moneyEarnRate = player.moneyEarnRate + change
      player.researched = player.researched + 1
      player.credits = player.credits + (purchase  * (1 - player.tradeDiscount))
    else
      openPlanet.actionResult = notEnoughCreds
    end
    
    
    -- fuel and upgrades can be bought at a lower cost
  elseif stat == "tradeDiscount" then
    
    local success = checkMinCreds(purchase * (1 - player.tradeDiscount))
    if success then
      player.tradeDiscount = player.tradeDiscount + change
      player.researched = player.researched + 1
      player.credits = player.credits + (purchase  * (1 - player.tradeDiscount))
    else
      openPlanet.actionResult = notEnoughCreds
    end
  end

  
end

function checkMaxFuel()
  
  return player.fuel < 5
  
end


function checkMinFuel(req)
  
  return player.fuel >= -req
  
end

function checkMinCreds(req)
  
  return player.credits >= -req
  
end









function animateSpace()
  
  if timer % 100 == 0 then
    if bg.curr == bg.src4 then
      bg.curr = bg.src1
    elseif bg.curr == bg.src1 then
      bg.curr = bg.src2
    elseif bg.curr == bg.src2 then
      bg.curr = bg.src3
    else
      bg.curr = bg.src4
    end
  end
  
  
end




