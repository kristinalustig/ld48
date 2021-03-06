local Galaxy = require "galaxy"

M = {}
M.__index = M

function M.new()
  
  local self = setmetatable({
      
      layerNum = 15,
      layers = {}
      
    }, M)

  self.layers[1] = {
      Galaxy.new("fuel", 1),
      Galaxy.new("ore", 1),
      Galaxy.new("research", 1)
    }

  for i=2, self.layerNum do
  
    local numOptions = love.math.random(2, 3)
    
    self.layers[i] = {}
    
    for j=1, numOptions do
      
      local seed = love.math.random(1, 100)
      local t = ""
      if seed <= 30 then t = "fuel"
      elseif seed <= 60 then t = "ore"
      elseif seed <= 90 then t = "research"
      else t = "random" end
      
      self.layers[i][j] = Galaxy.new(t, i)
      
    end
    
  end
  
  return self
  
end

return M