local Planets = require "planets"

M = {}
M.__index = M

function M.new(galaxyType)
  
  local self = setmetatable({
      
      galaxyType = galaxyType or "random",
      numPlanets = love.math.random(2, 5),
      planets = {},
      visited = false
      
      }, M)
  
  for i=1, self.numPlanets do
    
    self.planets[i] = Planets.new(self.galaxyType)
    
  end
  
  self.name = randomName(love.math.random(1, 50))
  self.src = randomImg(love.math.random(1, 16))
  
  return self
  
end

function randomName(seed)
  return "COOLIO"
end

function randomImg(seed)
  
  local posY = math.floor(seed / 4)
  if seed == 4 then posY = 0 elseif seed == 16 then posY = 3 end
  local posX = seed % 4
  
  g = gr.newQuad(192*posX, 192*posY, 192, 192, galaxySheet:getDimensions())
  
  return g

end

  
return M
  
