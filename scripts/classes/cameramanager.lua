CameraManager = {}
CameraManager.__index = CameraManager

function CameraManager.create()
	local CM = {}
	setmetatable(CM, CameraManager)
	
	CM.Cameras = {}
	CM.ActiveCamera = 0
	
	return CM
end

function CameraManager:setActiveCamera(n)
	self.ActiveCamera = n
end

function CameraManager:addCamera(cam)
	if cam ~= nil then
		table.insert(self.Cameras, cam)
	end
end

function CameraManager:setView()
	self.Cameras[self.ActiveCamera]:setView()
end