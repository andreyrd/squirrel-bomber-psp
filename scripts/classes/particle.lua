Particle = {}
Particle.__index = Particle

function Particle.create()
	local part = {}
	setmetatable(part, Particle)
	
	part.object = Object.create()
	
	part.velocity = Vector.create()
	
	part.increment = Vector.create()
	
	part.life = 20
	part.current = 1
	
	return part
end

function Particle:update()
	self.current = self.current + 1
	--The Emitter will control the life time
	
	self.velocity:addToPosition(self.increment.position[1], self.increment.position[2], self.increment.position[3])
	self.object.position:addToPosition(self.velocity.position[1], self.velocity.position[2], self.velocity.position[3])
end