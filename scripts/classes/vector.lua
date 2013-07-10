--requires:

Vector = {}
Vector.__index = Vector

function Vector.create(position, rotation)
	local vec = {}
	setmetatable(vec, Vector)
	
	vec.position = position or {}
	vec.rotation = rotation or {}
	vec.lposition = {0, 0, 0} -- Last position/rotation, used for fancy collision stuff :)
	vec.lrotation = {0, 0, 0}
	
	return vec
end

function Vector:addToPosition(x, y, z)
	self.lposition[1] = self.position[1]
	self.lposition[2] = self.position[2]
	self.lposition[3] = self.position[3]
	self.position[1] = self.position[1] + x
	self.position[2] = self.position[2] + y
	self.position[3] = self.position[3] + z
end

function Vector:setPosition(x, y, z)
	self.lposition[1] = self.position[1]
	self.lposition[2] = self.position[2]
	self.lposition[3] = self.position[3]
	self.position[1] = x
	self.position[2] = y
	self.position[3] = z
end

function Vector:addToRotation(x, y, z)
	self.lrotation[1] = self.rotation[1]
	self.lrotation[2] = self.rotation[2]
	self.lrotation[3] = self.rotation[3]
	self.rotation[1] = self.rotation[1] + x
	self.rotation[2] = self.rotation[2] + y
	self.rotation[3] = self.rotation[3] + z
end

function Vector:setRotation(x, y, z)
	self.lrotation[1] = self.rotation[1]
	self.lrotation[2] = self.rotation[2]
	self.lrotation[3] = self.rotation[3]
	self.rotation[1] = x
	self.rotation[2] = y
	self.rotation[3] = z
end

function Vector:rotateTowards(vector)
	local angleXZ = math.atan2(vector.position[3] - self.position[3], vector.position[1] - self.position[1])
	local angleYZ = math.atan2(vector.position[2] - self.position[2], vector.position[3] - self.position[3])
	
	self.lrotation[1] = self.rotation[1]
	self.lrotation[2] = self.rotation[2]
	self.lrotation[3] = self.rotation[3]
	self.rotation[1] = angleXZ
	self.rotation[2] = angleYZ
	self.rotation[3] = angleXZ
end

function Vector:getDistanceTo(vector)
	local d = math.sqrt((vector.position[1] - self.position[1])*(vector.position[1] - self.position[1]) + (vector.position[2] - self.position[2])*(vector.position[2] - self.position[2]) + (vector.position[3] - self.position[3])*(vector.position[3] - self.position[3]))
	return d
end

function Vector:moveTowards(vector, speed, Tr)
	self.lposition[1] = self.position[1]
	self.lposition[2] = self.position[2]
	self.lposition[3] = self.position[3]
	
	if Tr[1] then
		if self.position[1] > vector.position[1] then
			self.position[1] = self.position[1] - speed
		elseif self.position[1] < vector.position[1] then
			self.position[1] = self.position[1] + speed
		end
	end
	
	if Tr[2] then
		if self.position[2] > vector.position[2] then
			self.position[2] = self.position[2] - speed
		elseif self.position[2] < vector.position[2] then
			self.position[2] = self.position[2] + speed
		end
	end
	
	if Tr[3] then
		if self.position[3] > vector.position[3] then
			self.position[3] = self.position[3] - speed
		elseif self.position[3] < vector.position[3] then
			self.position[3] = self.position[3] + speed
		end
	end
end

function Vector:stepBack(Tr) -- Steps back to lpositon/lrotation
	delta = {}
	if Tr[1] then
		self.position[1] = self.lposition[1]
		self.position[2] = self.lposition[2]
		self.position[3] = self.lposition[3]
	end
	
	if Tr[2] then
		self.rotation[1] = self.lrotation[1]
		self.rotation[2] = self.lrotation[2]
		self.rotation[3] = self.lrotation[3]
	end
end