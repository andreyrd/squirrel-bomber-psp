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
	
	return tps
end


function TPSController:setModeSpeed(speed)
	self.moveSpeed = speed
end

function TPSController:setCameraSpeed(speed)
	self.cameraSpeed = speed
end

function TPSController:update()
	
	--Fix self.camera Angle:
	self.camera.position:rotateTowards(self.object.position)
	self.self.camera:lookAtPosition(self.object.position)
	
	--Move self.camera to player, if necessary
	--Move self.camera towards Player
	local Dist = self.object.position:getDistanceTo(self.camera.position)
	if Dist > 17 then	
		self.camera.position:moveTowards(self.object.position, self.cameraSpeed, {true, false, true})
	end
	
	--Movement
	CAngle = self.camera.position.rotation
	
	if controls.left() then
		self.object.position:setPosition(self.object.position.position[1] + math.cos(CAngle[1] + math.rad(270)) / 5, self.object.position.position[2], self.object.position.position[3] + math.sin(CAngle[1] + math.rad(270)) / 5)
	end
	if controls.right() then
		self.object.position:setPosition(self.object.position.position[1] + math.cos(CAngle[1] + math.rad(90)) / 5, self.object.position.position[2], self.object.position.position[3] + math.sin(CAngle[1] + math.rad(90)) / 5)
	end
	if controls.up() then
		self.object.position:setPosition(self.object.position.position[1] + math.cos(CAngle[1]) / 5, self.object.position.position[2], self.object.position.position[3] + math.sin(CAngle[1]) / 5)
	end
	if controls.down() then
		self.object.position:setPosition(self.object.position.position[1] + math.cos(CAngle[1] + math.rad(180)) / 5, self.object.position.position[2], self.object.position.position[3] + math.sin(CAngle[1] + math.rad(180)) / 5)
	end
	if controls.l() then
		self.camera.position:setPosition(self.camera.position.position[1] + math.cos(CAngle[1] + math.rad (270)) / 5, self.camera.position.position[2], self.camera.position.position[3] + math.sin(CAngle[1] + math.rad(270)) / 5)
	end
	if controls.r() then
		self.camera.position:setPosition(self.camera.position.position[1] + math.cos(CAngle[1] + math.rad (90)) / 5, self.camera.position.position[2], self.camera.position.position[3] + math.sin(CAngle[1] + math.rad(90)) / 5)
	end
end