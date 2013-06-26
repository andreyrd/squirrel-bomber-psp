Environment = {}
Environment.__index = Environment

function Environment.create()
	local Env = {}
	setmetatable(Env, Environment)
	
	Env.lights = true
	Env.ambient = color.new(0, 0, 0)
	Env.specular = 4.04
	Env.fogNear = 10
	Env.fogFar = 20
	Env.fogColor = color.new(0, 0 ,0)
	
	return Env
end

function Environment:setLights(status)
	self.lights = status
end

function Environment:setAmbient(color)
	self.ambient = color
end

function Environment:setSpecular(Str)
	self.specular = Str
end

function Environment:setFogNear(n)
	self.fogNear = n
end

function Environment:setFogFar(n)
	self.fogFar = n
end

function Environment:setFogColor(color)
	self.fogColor = color
end

function Environment:update()
	world.lights(self.lights)
	world.ambient(self.ambient)
	world.specular(self.specular)
	world.fog(self.fogNear, self.fogFar, self.fogColor)
	
	world.update()
end