FPSController = {}
FPSController.__index = FPSController

function FPSController.create()
	local fps = {}
	setmetatable(fps, TPSController)
	
	fps.camera = Camera.create()
	fps.collider = CollisionData.create()
	
	fps.moveSpeed = 5
	fps.lookSpeed = 0.5
	
	fps.surround = CollisionData.create()
	fps.collisions = {}
	
	fps.keys = Keys.create()
	
	return tps
end

function FPSController:addCollider(col)
	table.insert(self.collisions, col)
end

function FPSController:setModeSpeed(speed)
	self.moveSpeed = speed
end

function FPSController:update()
	--Look:
	if self.keys.left() then
		self.camera.position.rotation:addToRotation(0, -self.lookSpeed, 0)
	end
	if self.keys.right() then
		self.camera.position.rotation:addToRotation(0, self.lookSpeed, 0)
	end
	if self.keys.up() then
		self.camera.position.rotation:addToRotation(self.lookSpeed, 0, 0)
	end
	if self.keys.down() then
		self.camera.position.rotation:addToRotation(-self.lookSpeed, 0, 0)
	end
	
	--Move:
	
end