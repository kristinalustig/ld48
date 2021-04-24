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
  
  return self
  
end

function randomName(seed)
  return "COOLIO"
end

  
  
return M
  
