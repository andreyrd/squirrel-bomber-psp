FPSController = {}
FPSController.__index = FPSController

function FPSController.create()
	local fps = {}
	setmetatable(fps, FPSController)
	
	fps.keys = Keys.create()
	
	fps.camera = Camera.create()
	fps.position = Vector.create()
	fps.position:setPosition(0, 0, 0)
	fps.position:setRotation(0, 0, 0)
	fps.collider = CollisionData.create()
	fps.collider:setData({{-1, -1, -1}, {1, 1, 1}})
	fps.collisionObjects = {}
	fps.bounds = 10
	fps.moveSpeed = 0.1
	fps.lookSpeed = 3
	
	return fps
end

function FPSController:addCollisionObject(obj)
	table.insert(self.collisionObjects, obj)
end

function FPSController:setCollisionObjects(objs)
	for a = 1, #objs do
		table.insert(self.collisionobjects, objs[a])
	end
end

function FPSController:setMoveSpeed(speed)
	self.moveSpeed = speed
end

function FPSController:setLookSpeed(speed)
	self.lookSpeed = speed
end

function FPSController:setBounds(bound)
	self.bounds = bound
end

function FPSController:update()
	--First get lookat
	self.camera.position:setPosition(self.position.position[1], self.position.position[2], self.position.position[3])
	self.camera.position:setRotation(self.position.rotation[1], self.position.rotation[2], 0)
	self.camera:lookAtRotation()
	
	--Check controls.
	if self.keys.left() then
		self.position.rotation[1] = self.position.rotation[1] - self.lookSpeed
	end
	if self.keys.right() then
		self.position.rotation[1] = self.position.rotation[1] + self.lookSpeed
	end
	
	if self.keys.up() then
		self.position.rotation[2] = self.position.rotation[2] - self.lookSpeed
	end
	if self.keys.down() then
		self.position.rotation[2] = self.position.rotation[2] + self.lookSpeed
	end
	
	--Now I know :P
	local PPos = self.position.position
	local PRot = self.position.rotation
	
	if self.keys.triangle() then
		self.position:setPosition(PPos[1] + math.cos(math.rad(PRot[1])) * self.moveSpeed, PPos[2], PPos[3] + math.sin(math.rad(PRot[1])) * self.moveSpeed)
	end
	if self.keys.cross() then
		self.position:setPosition(PPos[1] + math.cos(math.rad(PRot[1] + 180)) * self.moveSpeed, PPos[2], PPos[3] + math.sin(math.rad(PRot[1] + 180)) * self.moveSpeed)
	end
	
	if self.keys.circle() then
		self.position:setPosition(PPos[1] + math.cos(math.rad(PRot[1] + 90)) * self.moveSpeed, PPos[2], PPos[3] + math.sin(math.rad(PRot[1] + 90)) * self.moveSpeed)
	end
	if self.keys.circle() then
		self.position:setPosition(PPos[1] + math.cos(math.rad(PRot[1] + 270)) * self.moveSpeed, PPos[2], PPos[3] + math.sin(math.rad(PRot[1] + 270)) * self.moveSpeed)
	end
end