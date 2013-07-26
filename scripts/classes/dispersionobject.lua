DispersionObject = {}
DispersionObject.__index = DispersionObject

function DispersionObject.create(Object, min, max)
  local disobj = {}
  setmetatable(disobj, DispersionObject)
  
  disobj.object = Object -- Object that will be dispersed
  disobj.min = min or nil -- minimum number of objects that will be dispersed
  disobj.max = max or nil -- maximum number of objects that will be dispersed
  
  disobj.enabled = true -- Will the object be rendered or has it been picked up?
  
  return disobj
end

function DispersionObject:setMin(min)
  self.min = min
end

function DispersionObject:setMax(max)
  self.max = max
end

function DispersionObject:enable()
  self.enabled = true
  self.object.collider:enable()
end

function DispersionObject:disable()
  self.enabled = false
  self.object.collider:disable()
end