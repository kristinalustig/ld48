local Planets = require "planets"

M = {}
M.__index = M

function M.new(galaxyType)
  
  local self = setmetatable({
      
      galaxyType = galaxyType or "random",
      numPlanets = math.random(2, 5),
      planets = {}
      
      }, M)
  
  for i=1, self.numPlanets do
    
    self.planets[i] = Planets.new(self.galaxyType)
    
  end
  
  return self
  
end

return M
