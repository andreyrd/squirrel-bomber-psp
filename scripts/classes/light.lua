Light = {}
Light.__index = Light

function Light.create(id)
	local light = {}
	setmetatable(light, Light)
	
	light.id = 1 or id
	light.enabled = true
	light.type = 2 --Point light by default
	
	light.attenuation = 0.0000004
	
	light.ambient = color.new(255, 255, 255)
	light.diffuse = color.new(0, 0, 0)
	
	light.component = 1
	
	light.direction = {0, 0, 0}
	
	light.cutting = 1
	light.angle = 90
	
	light.position = Vector.create()
		
	return light
end

function Light:update()
	world.lightenabled(self.id, self.enabled)
	world.lighttype(self.id, self.type)
	world.lightcomponent(self.id, self.component)
	
	world.lightambient(self.id, self.ambient)
	world.lightdiffuse(self.id, self.diffuse)
	
	world.lightposition(self.id, self.position.position[1], self.position.position[2], self.position.position[3])
	world.lightattenuation(self.id, 0, 0, self.attenuation)
	
	if self.type == 1 then
		world.lightdirection(self.id, self.direction[1], self.direction[2], self.direction[3])
	elseif self.type == 3 then
		world.lightspotlight(self.id, self.cutting, self.angle)
	end
end

function Light:setId(id)
	self.id = id
end

function Light:enable()
	self.enabled = true
end

function Light:disable()
	self.enabled = false
end

function Light:setType(n)
	self.type = n --1 = Directional, 2 = Point Light, 3 = Focus (Spot Light)
end

function Light:setDiffuse(col)
	self.diffuse = col
end

function Light:setAmbient(col)
	self.ambient = col
end