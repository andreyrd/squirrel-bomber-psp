ParticleEmitter = {}
ParticleEmitter.__index = ParticleEmitter

function ParticleEmitter.create()
	local pe = {}
	setmetatable(pe, ParticleEmitter)
	
	pe.position = Vector.create()
	pe.maxvelocity = Vector.create()
	pe.minvelocity = Vector.create()
	pe.otherfactor = Vector.create()
	
	pe.maxparticles = 100
	pe.minparticles = 50
	
	pe.particle = ""
	
	pe.particles = {}
	
	pe.respawn = 100
	pe.curspawn = 1
	
	return pe
end

function ParticleEmitter:setMaxParticles(n)
	self.maxparticles = n
end

function ParticleEmitter:setMinParticles(n)
	self.minparticles = n
end

function ParticleEmitter:setParticle(p)
	self.particle = p
end

function ParticleEmitter:setMaxVelocity(x, y, z)
	self.maxvelocity:setPosition(x, y, z)
end

function ParticleEmitter:setMinVelocity(x, y, z)
	self.minvelocity:setPosition(x, y, z)
end

function ParticleEmitter:setOtherFactors(x, y, z)
	self.otherfactor:setPosition(x, y, z)
end

function ParticleEmitter:update()
	
	self.curspawn = self.curspawn + 1
	
	if self.curspawn > self.respawn then
		self.curspawn = 1
		local maxVelX = self.maxvelocity.position[1]
		local minVelX = self.minvelocity.position[1]
		local maxVelY = self.maxvelocity.position[2]
		local minVelY = self.minvelocity.position[2]
		local maxVelZ = self.maxvelocity.position[3]
		local minVelZ = self.minvelocity.position[3]
		
		RandomParticles = math.random(self.minparticles - #self.particles, self.maxparticles - #self.particles)
		for a = 1, RandomParticles do
			--Create an individual instance of the particle to add to the table:
			local part = self.particle
			part.velocity:setPosition(math.random(minVelX, maxVelX), math.random(minVelY, maxVelY), math.random(minVelZ, maxVelZ))
			part.increment:setPosition(self.otherfactor.position[1], self.otherfactor.position[2], self.otherfactor.position[3])
			part.object.position:setPosition(self.position.position[1], self.position.position[2], self.position.position[3])
			table.insert(self.particles, part)
		end
	end
end