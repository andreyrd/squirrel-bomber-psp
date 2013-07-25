DispersionManager = {}
DispersionManager.__index = DispersionManager

function DispersionManager.create()
  local disman = {}
  setmetatable(disman, DispersionManager)
  
  disman.Objects = {}
  disman.colliders = {}
  
  return disman
end

function DispersionManager:addObject(object)
  table.insert(self.Objects, object)
end

function DispersionManager:passColliders(colliders) -- You can pass a table of colliders, like the one we use in TPSController
  self.colliders = colliders
end

function DispersionManager:addColliders(

function DispersionManager:disperse()
  for a = 1, #self.Objects, 1 do
    