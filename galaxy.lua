local Planets = require "planets"

M = {}
M.__index = M

function M.new(galaxyType, layerNum)
  
  local self = setmetatable({
      
      galaxyType = galaxyType or "random",
      numPlanets = love.math.random(2, 5),
      planets = {},
      visited = false,
      layerNum = layerNum
      
      }, M)
  
  for i=1, self.numPlanets do
    
    self.planets[i] = Planets.new(self.galaxyType)
    
  end
  
  self.name = randomName(love.math.random(1, 40))
  self.src = randomImg(love.math.random(1, 16))
  self.desc = randomDesc(love.math.random(1, 25), layerNum)
  
  return self
  
end

function randomName(seed)
  return galaxyNames[seed]
end

function randomImg(seed)
  
  local posY = math.floor(seed / 4)
  if seed == 4 then posY = 0 elseif seed == 16 then posY = 3 end
  local posX = seed % 4
  
  g = gr.newQuad(192*posX, 192*posY, 192, 192, galaxySheet:getDimensions())
  
  return g

end

function randomDesc(seed, l)
  
  return warpNarrative[l] .. " Anyway. \n \n" .. galaxyDescriptions[seed]
  
end


  
return M
  
