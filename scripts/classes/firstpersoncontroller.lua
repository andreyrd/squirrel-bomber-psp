FPSController = {}
FPSController.__index = FPSController

function FPSController.create(keys)
	local fps = {}
	setmetatable(fps, FPSController)
	
	fps.keys = keys
	
	fps.position = Vector.create()
	fps.collider = CollisionData.create()
	fps.collider:setData({{-1, -1, -1}, {1, 1, 1}})
	fps.bounds = 10
	fps.moveSpeed = 0.1
	
	return fps
end

function FPSController:setMoveSpeed(speed)
	self.moveSpeed = speed
end

function FPSController:setBounds(bound)
	self.bounds = bound
end

function FPSController:update()
	
end