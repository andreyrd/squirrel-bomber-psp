--Requires:

CollisionData = {}
CollisionData.__index = CollisionData


--Data = 
--[[
	{
		{Minimum x, Minimum y, minimum z},
		{Width, Height, Depth}
	}
]]

function CollisionData.create(Data)
	local col = {}
	setmetatable(col, CollisionData)
	col.data = Data or nil
	col.position = Vector.create()
	col.radius = nil
	col.Type = 1 --1 = box, 2 = cylindrical.
	
	col.extreme = {}
	for a = 1, 4 do
		col.extreme[a] = Vector.create()
	end
	
	return col
end

function CollisionData:findExtreme(vector, Fw, Bw, Rw, Lw)
	self.extreme[1]:setPosition(vector.position[1] + math.cos(vector.rotation[1]) * Fw, vector.position[2], vector.position[3] + math.sin(vector.rotation[1]) * Fw)
	self.extreme[2]:setPosition(vector.position[1] + math.cos(vector.rotation[1] + math.rad(180)) * Bw, vector.position[2], vector.position[3] + math.sin(vector.rotation[1] + math.rad(180)) * Bw)
	self.extreme[3]:setPosition(vector.position[1] + math.cos(vector.rotation[1] + math.rad(90)) * Rw, vector.position[2], vector.position[3] + math.sin(vector.rotation[1] + math.rad(90)) * Rw)
	self.extreme[4]:setPosition(vector.position[1] + math.cos(vector.rotation[1] + math.rad(270)) * Lw, vector.position[2], vector.position[3] + math.sin(vector.rotation[1] + math.rad(270)) * Lw)
end

function CollisionData:setType(n)
	self.Type = n
end

function CollisionData:setRadius(radd)
	self.radius = radd
end

function CollisionData:setData(Data)
	self.data = Data
end
function CollisionData:checkCollision(Collider)
	--Collision Check
	
	--if x + Width > x2 and x < x2 + Width then
	if self.data[1][1] + self.data[2][1] + self.position.position[1] > Collider.data[1][1] + Collider.position.position[1] and self.data[1][1] + self.position.position[1] < Collider.data[1][1] + Collider.data[2][1] + Collider.position.position[1] then
		--if y + Height > y2 and y < y2 + Height then
		if self.data[1][2] + self.data[2][2] + self.position.position[2] > Collider.data[1][2] + Collider.position.position[2] and self.data[1][2] + self.position.position[2] < Collider.data[1][2] + Collider.data[2][2] + Collider.position.position[2] then
			--if z + Depth > z2 and z < z2 + Depth
			if self.data[1][3] + self.data[2][3] + self.position.position[3] > Collider.data[1][3] + Collider.position.position[3] and self.data[1][3] + self.position.position[3]  < Collider.data[1][3] + Collider.data[2][3] + Collider.position.position[3] then
				--COLLISION :D
				return true
			end
		end
	end
	
	return false
end

function CollisionData:capsuleCollision(vertice)
	local d = vertice:getDistanceTo(self.position)
	if math.abs(d) < self.radius then
		return true, d
	else
		return false, d
	end
end