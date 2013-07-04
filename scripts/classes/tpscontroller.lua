TPSController = {}
TPSController.__index = TPSController

function TPSController.create(model)
	local tps = {}
	setmetatable(tps, TPSController)
	
	
	tps.object = Object.create(model)
	
	tps.camera = Camera.create()
	tps.camera.position:setPosition(1, 13, 0)
	tps.cameraCollider = CollisionData.create()
	
	tps.moveSpeed = 5
	tps.cameraSpeed = 0.12
	
	tps.colliders = {}
	
	tps.fw = 1
	tps.bw = 1
	tps.lw = 1
	tps.rw = 1
	
	return tps
end


function TPSController:setForwardWidth(n)
	self.fw = n
end
function TPSController:setBackwardWidth(n)
	self.bw = n
end
function TPSController:setRightWidth(n)
	self.rw = n
end
function TPSController:setLeftWidth(n)
	self.lw = n
end

function TPSController:setModeSpeed(speed)
	self.moveSpeed = speed
end

function TPSController:setCameraSpeed(speed)
	self.cameraSpeed = speed
end

function TPSController:setCameraCollider(data)
	self.cameraCollider:setData(data)
end

function TPSController:addCollider(col)
	table.insert(self.colliders, col)
end

function TPSController:update()
	--Update the extremes:
	self.object.collider:findExtreme(self.object.position, self.fw, self.bw, self.rw, self.lw)
	
    self.cameraCollider.position.position = self.camera.position.position -- accessing variable is OK since we won't be stepBack'ing the collider ;)
	
	--Fix Camera Angle:
	self.camera.position:rotateTowards(self.object.position)
	self.camera:lookAtPosition(self.object.position)
	
	--Move camera to player, if necessary
	--Move Cam towards Player
	local Dist = self.object.position:getDistanceTo(self.camera.position)
	if Dist > 17 then	
		self.camera.position:moveTowards(self.object.position, self.cameraSpeed, {true, false, true})
	end
	
	--Movement
	CAngle = self.camera.position.rotation
	
	local Delta = Vector.create()
	Delta:setPosition(self.object.position.position[1], self.object.position.position[2], self.object.position.position[3])
	
	local Collision = false
	
	if controls.left() then
		self.object.position:setPosition(self.object.position.position[1] + math.cos(CAngle[1] + math.rad(270)) / 5, self.object.position.position[2], self.object.position.position[3] + math.sin(CAngle[1] + math.rad(270)) / 5)
		
		Collision = false
		for a = 1, #self.colliders do
			if self.colliders[a].Type == 1 then
				if self.object.collider:checkCollision(self.colliders[a]) then
					Collision = true
				end
			else
				for b = 1, 4 do
					if self.colliders[a]:capsuleCollision(self.object.collider.extreme[b]) then
						Collision = true
						break
					end
				end
			end
		end
		if Collision then
			self.object.position:stepBack({true, false})
			self.object:update()
		end
	end
	
	if controls.right() then
		self.object.position:setPosition(self.object.position.position[1] + math.cos(CAngle[1] + math.rad(90)) / 5, self.object.position.position[2], self.object.position.position[3] + math.sin(CAngle[1] + math.rad(90)) / 5)
		
		Collision = false
		for a = 1, #self.colliders do
			if self.colliders[a].Type == 1 then
				if self.object.collider:checkCollision(self.colliders[a]) then
					Collision = true
				end
			else
				for b = 1, 4 do
					if self.colliders[a]:capsuleCollision(self.object.collider.extreme[b]) then
						Collision = true
						break
					end
				end
			end
		end
		if Collision then
			self.object.position:stepBack({true, false})
			self.object:update()
		end
	end
	
	if controls.up() then
		self.object.position:setPosition(self.object.position.position[1] + math.cos(CAngle[1]) / 5, self.object.position.position[2], self.object.position.position[3] + math.sin(CAngle[1]) / 5)
		
		Collision = false
		for a = 1, #self.colliders do
			if self.colliders[a].Type == 1 then
				if self.object.collider:checkCollision(self.colliders[a]) then
					Collision = true
				end
			else
				for b = 1, 4 do
					if self.colliders[a]:capsuleCollision(self.object.collider.extreme[b]) then
						Collision = true
						break
					end
				end
			end
		end
		if Collision then
			self.object.position:stepBack({true, false})
			self.object:update()
		end
	end
	
	if controls.down() then
		self.object.position:setPosition(self.object.position.position[1] + math.cos(CAngle[1] + math.rad(180)) / 5, self.object.position.position[2], self.object.position.position[3] + math.sin(CAngle[1] + math.rad(180)) / 5)
		
		Collision = false
		for a = 1, #self.colliders do
			if self.colliders[a].Type == 1 then
				if self.object.collider:checkCollision(self.colliders[a]) then
					Collision = true
				end
			else
				for b = 1, 4 do
					if self.colliders[a]:capsuleCollision(self.object.collider.extreme[b]) then
						Collision = true
						break
					end
				end
			end
		end
		if Collision then
			self.object.position:stepBack({true, false})
			self.object:update()
		end
	end
	
	
	--Debug Collision Testing:
	Distances = {}
	for a = 1, #self.colliders do
		if self.colliders[a].Type == 2 then
			for b = 1, 4 do
				Sta, Pra = self.colliders[a]:capsuleCollision(self.object.collider.extreme[b])
				Distances[b] = Pra
				if Sta then
					screen.print(0, 64 + b * 14 - 14, "Collision. Distance: " .. Distances[b] .. "  Tree: " .. a, color.new(255, 0, 0))
				end
			end
		end
	end
	
	if controls.l() then
		self.camera.position:setPosition(self.camera.position.position[1] + math.cos(CAngle[1] + math.rad (270)) / 5, self.camera.position.position[2], self.camera.position.position[3] + math.sin(CAngle[1] + math.rad(270)) / 5)
	end
	if controls.r() then
		self.camera.position:setPosition(self.camera.position.position[1] + math.cos(CAngle[1] + math.rad (90)) / 5, self.camera.position.position[2], self.camera.position.position[3] + math.sin(CAngle[1] + math.rad(90)) / 5)
	end
end