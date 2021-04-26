M = {}
M.__index = M

function M.new(parentType)
  
  local self = setmetatable({
      
      parentType = parentType,
      imgSeed = love.math.random(1, 25),
      nameSeed = love.math.random(1, 40),
      descSeed = love.math.random(1, 24),
      typeSeed = love.math.random(1, 100),
      interactionSeed = love.math.random(1, 10),
      actionTaken = false,
      actionResult = nil
      
      }, M)
  
  self.src = planetRImage(self.imgSeed)
  self.name = planetRName(self.nameSeed)
  self.pType = planetRType(self.typeSeed, self.parentType)
  self.desc = planetRDesc(self.descSeed)
  self.inter = planetRInteraction(self.interactionSeed, self.pType)
  
  return self
  
end

function planetRImage(seed)
  
  local posY = math.floor(seed / 5)
  if seed == 5 then posY = 0 elseif seed == 40 then posY = 4 end
  local posX = seed % 5
  
  p = gr.newQuad(64*posX, 64*posY, 64, 64, planetSheet:getDimensions())
  
  return p
  
end

function planetRName(seed)
  
  return planetNames[seed]
  
end

function planetRDesc(seed)
  
  return planetDescriptions[seed]

  
end

function planetRType(seed, t)
  
  if seed <= 50 then return t
  elseif seed <= 60 then return "fuel"
  elseif seed <= 85 then return "ore"
  else return "research" end
  
end

function planetRInteraction(seed, pType)
  
  if pType == "fuel" then
    return fuelActions[seed]
  elseif pType == "ore" then
    return moneyActions[seed]
  elseif pType == "research" then
    return researchActions[seed]
  else
    if seed % 2 == 0 then
      return moneyActions[seed]
    elseif seed % 3 == 0 then
      return fuelActions[seed]
    else
      return researchActions[seed]
    end
  end
  
end

return M