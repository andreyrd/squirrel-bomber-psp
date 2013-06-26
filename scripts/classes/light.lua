Light = {}
Light.__index = Light

function Light.create(id)
	local light = {}
	setmetatable(light, Light)
	
	light.id = 1 or id
	light.enabled = true
	light.type = 2 --Point light by default
	
	light.ambient = color.new(255, 255, 255)
	light.diffuse = color.new(0, 0, 0)
	
	light.position = Vector.create()
		
	return light
end

function Light:update()
	world.lightenabled(self.id, self.enabled)
	world.lighttype(self.id, self.type)
	world.lightambient(self.id, self.ambient)
	world.lightdiffuse(self.id, self.diffuse)
	
	world.lightposition(self.id, self.position.position[1], self.position.position[2], self.position.position[3])
	world.lightattenuation(self.id, 0, 0, 0.0000005)
end

function Light:setId(id)
	self.id = id
end

function Light:enabled(Status)
	self.enabled = Status
end

function Light:setType(n)
	self.type = n
end

function Light:setDiffuse(col)
	self.diffuse = col
end

function Light:setAmbient(col)
	self.ambient = col
end