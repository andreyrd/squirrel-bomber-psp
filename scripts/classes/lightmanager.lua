LightManager = {}
LightManager.__index = LightManager

function LightManager.create()
	local LM = {}
	setmetatable(LM, LightManager)
	
	LM.Lights = {}
	
	return LM
end


function LightManager:addLight(light)
	table.insert(self.Lights, light)
end

function LightManager:removeLight(id)
	table.remove(self.Lights, id)
end