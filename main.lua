local Galaxy = require "galaxy"
local Player = require "player"
local Map = require "map"
require "conf"

function love.load()
  
  gr = love.graphics
  
  spaceFont = love.graphics.newImageFont('src/outerfont.png', ' ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890!?.,"\'-()$:;@+=*%')
  
  galaxyMap = Map.new()
  
  intro = 1
  
  timer = 0
  
  stats = gr.newImage("src/stats.png")
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
  end
  
end

function love.draw()
  
  gr.setFont(spaceFont)
  
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
    
    gr.draw(stats, 30, 22)
    gr.draw(textbox, 30, 90)
    gr.printf("The quick brown fox jumped over the lazy dog, wow wow wow! I can't believe this is working! How many characters can I generally fit into this thing? Even more than this? Let's keep going and adding even more characters, and add in some numbers too. $500 credits, please! \"NO WAY\" ", 50, 110, 300)
    
  end
  
end

function love.mousepressed(x, y, button, istouch)
  
  if intro == 1 then
    
    if testOverlap(x, y, start) then intro = 2 end
    
  elseif intro == 2 then
    
    if testOverlap(x, y, arrowR) then intro = 3 end
    
  elseif intro == 3 then
    
    if testOverlap(x, y, arrowR) then intro = 4
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

