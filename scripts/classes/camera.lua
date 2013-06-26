--Requires:
--vector.lua

Camera = {}
Camera.__index = Camera

function Camera.create(Vector3)
	local cam = {}
	setmetatable(cam, Camera)
	
	cam.position = Vector3
	cam.lookAt = {0, 0, 0}
	cam.up = {0, 1, 0}
	return cam
end

function Camera:update()
	self.lookAt[1] = self.position.position[1] + math.cos(self.position.rotation[1])
	self.lookAt[2] = self.position.position[2] + math.cos(self.position.rotation[2])
	self.lookAt[3] = self.position.position[3] + math.sin(self.position.rotation[1])
	
	world.lookat(self.position.position, self.lookAt, self.up)
end