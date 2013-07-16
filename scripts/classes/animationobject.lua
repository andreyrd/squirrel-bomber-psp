AnimationObject = {}
AnimationObject.__index = AnimationObject

function AnimationObject.create()
	local obj = {}
	setmetatable(obj, AnimationObject)
	
	obj.position = Vector.create({0, 0, 0}, {0, 0, 0})
	obj.collider = CollisionData.create()
	
	obj.Models = {}
	
	obj.Speed = 1
	obj.CurrentSpeedIterator = 1 --Don't know what to name this :P
	obj.currentFrame = 1
	
	return obj
end

function AnimationObject:setSpeed(sp)
	self.Speed = sp
end

function AnimationObject:addModel(model)
	table.insert(self.Models, model)
end

function AnimationObject:reset()
	self.currentFrame = 1
end

function AnimationObject:update() --Updates the collider
	self.collider.position:setPosition(self.position.position[1], self.position.position[2], self.position.position[3])
end

function AnimationObject:play()
	if self.CurrentSpeedIterator < self.Speed then
		self.CurrentSpeedIterator = self.CurrentSpeedIterator + 1
	else
		if self.currentFrame < #self.Models then
			self.currentFrame = self.currentFrame + 1
		else
			self.currentFrame = 1
		end
		self.CurrentSpeedIterator = 1
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