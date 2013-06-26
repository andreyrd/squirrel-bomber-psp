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
	return col
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