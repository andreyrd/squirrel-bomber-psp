Vector = {}
Vector.__index = Vector

function Vector.create(position, rotation)
	local vec = {}
	setmetatable(vec, Vector)
	
	vec.position = position
	vec.rotation = rotation
	
	return vec
end

function Vector:getPosition()
	return self.position[1], self.position[2], self.position[3]
end

function Vector:setPosition(x, y, z)
	self.position[1] = x
	self.position[2] = y
	self.position[3] = z
end


function Vector:getRotation()
	return self.rotation[1], self.rotation[2], self.rotation[3]
end

function Vector:setRotation(x, y, z)
	self.rotation[1] = x
	self.rotation[2] = y
	self.rotation[3] = z
end