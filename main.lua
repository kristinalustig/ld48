local Galaxy = require "galaxy"
local Player = require "player"
local Map = require "map"
require "conf"

function love.load()
  
  galaxyMap = Map.new()
  
  intro = true
  
  print(galaxyMap.layers[1][1].planets[2].name)
  
  -- THIS IS FOR TESTING TO MAKE SURE GENERATION IS WORKING
  for i=1, table.getn(galaxyMap.layers) do
    for j=1, table.getn(galaxyMap.layers[i]) do
      for k=1, table.getn(galaxyMap.layers[i][j].planets) do
        local pname = galaxyMap.layers[i][j].planets[k].name
        print(pname)
      end
    end
  end
  
end

function love.update(dt)
  
  
  
end

function love.draw()
   
  
  
end
