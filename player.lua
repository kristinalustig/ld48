M = {}
M.__index = M

function M.new()
  
  local self = setmetatable({
      
      location = galaxyMap[1][1],
      fuel = 100,
      credits = 0,
      discoveries = 0
      
      }, M)
  
  return self
  
end

return M