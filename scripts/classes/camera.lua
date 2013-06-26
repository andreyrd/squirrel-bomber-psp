--Requires:
--vector.lua

Camera = {}
Camera.__index = Camera

function Camera.create()
	local cam = {}
	setmetatable(cam, Camera)
	
	cam.position = Vector.create({0, 0, 0}, {0, 0, 0})
	cam.lookAt = {0, 0, 1}
	cam.up = {0, 1, 0}
	return cam
end

function Camera:update()
	self.lookAt[1] = self.position.position[1] + math.cos(math.rad(self.position.rotation[1])) * 2
	self.lookAt[3] = self.position.position[3] + math.sin(math.rad(self.position.rotation[1])) * 2
	self.lookAt[2] = self.position.position[2] + math.cos(math.rad(self.position.rotation[2])) * 2
	
end

function Camera:setView()
	world.lookat(self.position.position, self.lookAt, self.up)
end