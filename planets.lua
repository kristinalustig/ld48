M = {}
M.__index = M

function M.new(parentType)
  
  local self = setmetatable({
      
      parentType = parentType,
      imgSeed = math.random(1, 100),
      nameSeed = math.random(1, 100),
      descSeed = math.random(1, 100),
      typeSeed = math.random(1, 100),
      interactionSeed = math.random(1, 100)
      
      }, M)
  
  self.image = planetRImage(self.imgSeed)
  self.name = planetRName(self.nameSeed)
  self.pType = planetRType(self.typeSeed, self.parentType)
  self.desc = planetRDesc(self.descSeed)
  self.inter = planetRInteraction(self.interactionSeed)
  
  return self
  
end

function planetRImage(seed)
  
  return "/src/p.png"
  
end

function planetRName(seed)
  
  return "PLANET B-100"
  
end

function planetRDesc(seed)
  
  return "This is a cool planet description. Wow."
  
end

function planetRType(seed, t)
  
  if seed <= 50 then return t
  elseif seed <= 60 then return "fuel"
  elseif seed <= 85 then return "ore"
  else return "research" end
  
end

function planetRInteraction(seed)
  
  return "Option"
  
end

return M