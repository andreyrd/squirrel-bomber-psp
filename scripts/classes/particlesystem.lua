ParticleSystem = {}
ParticleSystem.__index = ParticleSystem

function ParticleSystem.create()
	local ps = {}
	setmetatable(ps, ParticleSystem)
	
	ps.emitter = ParticleEmitter.create()
	ps.particle = Particle.create()
	
	ps.emitter:setParticle(ps.particle)
	
	return ps
end


function ParticleSystem:update()
	self.emitter:update()
	for a = 1, #self.emitter.particles do
		self.emitter.particles[a]:update()
		if self.emitter.particles[a].current > self.emitter.particles[a].life then
			table.remove(self.emitter.particles, a)
		end
	end
end