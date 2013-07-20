TPSController = {}
TPSController.__index = TPSController

function TPSController.create(object_)
	local tps = {}
	setmetatable(tps, TPSController)
	
	tps.object = object_
	
	tps.camera = Camera.create()
	tps.camera.position:setPosition(1, 13, 0)
	tps.cameraCollider = CollisionData.create({{-(5)/2, 0, -(5)/2}, {5, 5, 5}})
	
	tps.moveSpeed = 15
	tps.cameraSpeed = 0.18
	
	tps.colliders = {}
	
	tps.fw = 0.5
	tps.bw = 0.5
	tps.lw = 0.5
	tps.rw = 0.5
	
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

function TPSController:collisionCheck()
	collision = false
	self.object.collider:findExtreme(self.object.position, self.fw, self.bw, self.rw, self.lw)
	for a = 1, #self.colliders do
		if self.colliders[a].Type == 1 then
			if self.object.collider:checkCollision(self.colliders[a]) then
				collision = true
			end
		else
			for b = 1, 4 do
				if self.colliders[a]:capsuleCollision(self.object.collider.extreme[b]) then
					collision = true
					break
				end
			end
		end
		if collision then -- Since we have a nested loop it's better to have it check if collided in an if statement
			break
		end
	end
	return collision
end

function TPSController:collisionAct()
	if self:collisionCheck() then
		self.object.position:stepBack({true, false})
		for a = 1, 4 do
			self.object.position:setPosition(self.object.position.position[1] + math.cos(CAngle[1] + math.rad(a * 22.5)) / 5,
											 self.object.position.position[2],
											 self.object.position.position[3] + math.sin(CAngle[1] + math.rad(a * 22.5)) / 5)
			self.object:update()
			if self:collisionCheck() then
				self.object.position:stepBack({true, false})
			else
				break
			end
			self.object.position:setPosition(self.object.position.position[1] + math.cos(CAngle[1] + math.rad(a * -22.5)) / 5,
											 self.object.position.position[2],
											 self.object.position.position[3] + math.sin(CAngle[1] + math.rad(a * -22.5)) / 5)
			self.object:update()
			if self:collisionCheck() then
				self.object.position:stepBack({true, false})
			else
				break
			end
		end
		self.object:update()
	end
end

function TPSController:camCollisionCheck()
	collision = false
	self.cameraCollider.position:setPosition(self.camera.position.position[1],
											 self.camera.position.position[2],
											 self.camera.position.position[3])
	for a = 1, #self.colliders do
		if self.cameraCollider:checkCollision(self.colliders[a]) then
			collision = true
			break
		end
	end
	return collision
end

function TPSController:camCollisionAct()
	if self:camCollisionCheck() then
		self.camera.position:stepBack({true, false})
		for a = 1, 6 do
			self.camera.position:setPosition(self.camera.position.position[1] + math.cos(CAngle[1] + math.rad(a * 15)) / 5,
											 self.camera.position.position[2],
											 self.camera.position.position[3] + math.sin(CAngle[1] + math.rad(a * 15)) / 5)
			if self:camCollisionCheck() then
				self.camera.position:stepBack({true, false})
			else
				break
			end
			self.camera.position:setPosition(self.camera.position.position[1] + math.cos(CAngle[1] + math.rad(a * -15)) / 5,
											 self.camera.position.position[2],
											 self.camera.position.position[3] + math.sin(CAngle[1] + math.rad(a * -15)) / 5)
			if self:camCollisionCheck() then
				self.camera.position:stepBack({true, false})
			else
				break
			end
		end
		self.camera:update()
	end
end

function TPSController:update()
    self.cameraCollider.position.position = self.camera.position.position -- accessing variable is OK since we won't be stepBack'ing the collider ;)
	
	--Fix Camera Angle:
	self.camera.position:rotateTowards(self.object.position)
	self.camera:lookAtPosition(self.object.position)
	
	CAngle = self.camera.position.rotation
	
	--Move camera to player, if necessary
	local Dist = self.object.position:getDistanceTo(self.camera.position)
	if Dist > 19 then	
		self.camera.position:moveTowards(self.object.position, self.cameraSpeed, {true, false, true})
		self:camCollisionAct()
	elseif Dist < 15 then
		self.camera.position:moveTowards(self.object.position, -self.cameraSpeed, {true, false, true})
		self:camCollisionAct()
	end
	
	local Delta = Vector.create()
	Delta:setPosition(self.object.position.position[1], self.object.position.position[2], self.object.position.position[3])
	
	if controls.up() and controls.right() then
		self.object.position:setPosition(self.object.position.position[1] + (math.cos(CAngle[1]) / 5 + math.cos(CAngle[1] + math.rad(90)) / 5) * (math.sqrt(2)/2),
										 self.object.position.position[2],
										 self.object.position.position[3] + (math.sin(CAngle[1]) / 5 + math.sin(CAngle[1] + math.rad(90)) / 5) * (math.sqrt(2)/2))
		self.object.position:setRotation(self.object.position.rotation[1],
										 math.rad(45) - CAngle[1],
										 self.object.position.rotation[3])
		self.object:update()
		self.object:play()
		self:collisionAct()
	elseif controls.down() and controls.right() then
		self.object.position:setPosition(self.object.position.position[1] + (math.cos(CAngle[1] + math.rad(180)) / 5 + math.cos(CAngle[1] + math.rad(90)) / 5) * (math.sqrt(2)/2),
										 self.object.position.position[2],
										 self.object.position.position[3] + (math.sin(CAngle[1] + math.rad(180)) / 5 + math.sin(CAngle[1] + math.rad(90)) / 5) * (math.sqrt(2)/2))
		self.object.position:setRotation(self.object.position.rotation[1],
										 math.rad(315) - CAngle[1],
										 self.object.position.rotation[3])
		self.object:update()
		self.object:play()
		self:collisionAct()
	elseif controls.down() and controls.left() then
		self.object.position:setPosition(self.object.position.position[1] + (math.cos(CAngle[1] + math.rad(180)) / 5 + math.cos(CAngle[1] + math.rad(270)) / 5) * (math.sqrt(2)/2),
										 self.object.position.position[2],
										 self.object.position.position[3] + (math.sin(CAngle[1] + math.rad(180)) / 5 + math.sin(CAngle[1] + math.rad(270)) / 5) * (math.sqrt(2)/2))
		self.object.position:setRotation(self.object.position.rotation[1],
										 math.rad(225) - CAngle[1],
										 self.object.position.rotation[3])
		self.object:update()
		self.object:play()
		self:collisionAct()
	elseif controls.up() and controls.left() then
		self.object.position:setPosition(self.object.position.position[1] + (math.cos(CAngle[1]) / 5 + math.cos(CAngle[1] + math.rad(270)) / 5) * (math.sqrt(2)/2),
										 self.object.position.position[2],
										 self.object.position.position[3] + (math.sin(CAngle[1]) / 5 + math.sin(CAngle[1] + math.rad(270)) / 5) * (math.sqrt(2)/2))
		self.object.position:setRotation(self.object.position.rotation[1],
										 math.rad(135) - CAngle[1],
										 self.object.position.rotation[3])
		self.object:update()
		self.object:play()
		self:collisionAct()
	elseif controls.up() then
		self.object.position:setPosition(self.object.position.position[1] + math.cos(CAngle[1]) / 5,
										self.object.position.position[2],
										self.object.position.position[3] + math.sin(CAngle[1]) / 5)
		self.object.position:setRotation(self.object.position.rotation[1],
										 math.rad(90) - CAngle[1],
										 self.object.position.rotation[3])
		self.object:update()
		self.object:play()
		self:collisionAct()
	elseif controls.right() then
		self.object.position:setPosition(self.object.position.position[1] + math.cos(CAngle[1] + math.rad(90)) / 5,
										self.object.position.position[2],
										self.object.position.position[3] + math.sin(CAngle[1] + math.rad(90)) / 5)
		self.object.position:setRotation(self.object.position.rotation[1],
										 -CAngle[1],
										 self.object.position.rotation[3])
		self.object:update()
		self.object:play()
		self:collisionAct()
	elseif controls.down() then
		self.object.position:setPosition(self.object.position.position[1] + math.cos(CAngle[1] + math.rad(180)) / 5,
										self.object.position.position[2],
										self.object.position.position[3] + math.sin(CAngle[1] + math.rad(180)) / 5)
		self.object.position:setRotation(self.object.position.rotation[1],
										 math.rad(270) - CAngle[1],
										 self.object.position.rotation[3])
		self.object:update()
		self.object:play()
		self:collisionAct()
	elseif controls.left() then
		self.object.position:setPosition(self.object.position.position[1] + math.cos(CAngle[1] + math.rad(270)) / 5,
										self.object.position.position[2],
										self.object.position.position[3] + math.sin(CAngle[1] + math.rad(270)) / 5)
		self.object.position:setRotation(self.object.position.rotation[1],
										 math.rad(180) - CAngle[1],
										 self.object.position.rotation[3])
		self.object:update()
		self.object:play()
		self:collisionAct()
	else
		self.object:reset() --Resets the animation
	end
	
	if controls.l() then
		self.camera.position:setPosition(self.camera.position.position[1] + math.cos(CAngle[1] + math.rad (270)) / 5, self.camera.position.position[2], self.camera.position.position[3] + math.sin(CAngle[1] + math.rad(270)) / 5)
		self:camCollisionAct()
	elseif controls.r() then
		self.camera.position:setPosition(self.camera.position.position[1] + math.cos(CAngle[1] + math.rad (90)) / 5, self.camera.position.position[2], self.camera.position.position[3] + math.sin(CAngle[1] + math.rad(90)) / 5)
		self:camCollisionAct()
	end
end