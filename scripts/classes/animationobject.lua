AnimationObject = {}
AnimationObject.__index = AnimationObject

function AnimationObject.create()
	local obj = {}
	setmetatable(obj, AnimationObject)
	
	obj.position = Vector.create()
	
	obj.Models = {}
	
	obj.Speed = 1
	obj.currentFrame = 1
	
	return obj
end

function AnimationObject:reset()
	self.currentFrame = 1
end

function AnimationObject:play()
	if self.currentFrame <= #self.Models then
		self.currentFrame = self.currentFrame + 1
	else
		self.currentFrame = 1
	end
end

--Implements Model object functions.
function AnimationObject:position(x, y, z)
	self.position:setPosition(x, y, z)
end

function AnimationObject:rotation(x, y, z)
	self.position:setRotation(x, y, z)
end

function AnimationObject:blit()
	self.Models[self.currentFrame]:rotation(self.position.rotation[1], self.position.rotation[2], self.position.rotation[3])
	self.Models[self.currentFrame]:position(self.position.position[1], self.position.position[2], self.position.position[3])
	
	self.Models[self.currentFrame]:blit()
end