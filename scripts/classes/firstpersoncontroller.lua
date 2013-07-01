FPSController = {}
FPSController.__index = FPSController

function FPSController.create(keys)
	local fps = {}
	setmetatable(fps, FPSController)
	
	fps.keys = keys
	
	fps.camera = Camera.create()
	fps.position = Vector.create()
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
	self.camera:setView()
	
	--Check controls.
	if self.keys.square() then
		self.position.rotation[1] = self.position.rotation[1] - self.lookSpeed
	end
	if self.keys.circle() then
		self.position.rotation[1] = self.position.rotation[1] + self.lookSpeed
	end
	
	if self.keys.cross() then
		self.position.rotation[2] = self.position.rotation[2] - self.lookSpeed
	end
	if self.keys.triangle() then
		self.position.rotaiton[2] = self.position.rotation[2] + self.lookSpeed
	end
	
	--Haven't figured out how I want to do movement yet :/
end