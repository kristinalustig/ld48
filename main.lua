local Galaxy = require "galaxy"
local Player = require "player"
local Map = require "map"
require "conf"

function love.load()
  
  gr = love.graphics
  
  spaceFont = love.graphics.newImageFont('src/outerfont.png', ' ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890!?.,"\'-()$:;@+=*%')
  
  galaxyMap = Map.new()
  
  intro = true
  
  stats = gr.newImage("src/stats.png")
  textbox = gr.newImage("src/textbox.png")
  
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
  
  
  
end

function love.draw()
  
  gr.draw(stats, 30, 22)
  gr.draw(textbox, 30, 100)
  gr.draw(gr.newText(spaceFont, "The quick brown fox"), 46, 120)
  
end
