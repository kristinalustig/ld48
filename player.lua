M = {}
M.__index = M

function M.new()
  
  local self = setmetatable({
      
      location = galaxyMap.layers[5][1],
      currPlanet = galaxyMap.layers[1][1].planets[1],
      fuel = 3,
      credits = 10,
      discoveries = 0
      
      }, M)
  
  return self
  
end

return M