M = {}
M.__index = M

function M.new()
  
  local self = setmetatable({
      
      location = galaxyMap.layers[1][1],
      currentLayer = 1,
      fuel = 3,
      credits = 10,
      researched = 0,
      fuelBurnRate = 1,
      fuelEarnRate = .5,
      moneyEarnRate = 0,
      tradeDiscount = 0
      
      }, M)
  
  return self
  
end

return M