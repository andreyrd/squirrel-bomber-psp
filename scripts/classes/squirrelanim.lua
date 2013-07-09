SquirrelAnim = {}
SquirrelAnim.__index = SquirrelAnim

function SquirrelAnim.create()
	local sqran = {}
	setmetatable(sqran, SquirrelAnim)
	
	sqran.body = Object.create(model.load('objects/squirrel_body.obj'))
	sqran.frontlegs = Object.create(model.load('objects/squirrel_frontlegs.obj'))
	sqran.backlegs = Object.create(model.load('objects/squirrel_backlegs.obj'))
	
	sqran.deltapos_body = Vector.create({0, 0, 0}, {0, 0, 0})
	sqran.deltapos_fl = Vector.create({0, 0, 0}, {0, 0, 0})
	sqran.deltapos_bl = Vector.create({0, 0, 0}, {0, 0, 0})
	
	sqran.position = Vector.create()
	
	sqran.frame = 1
	sqran.speed = 5 -- Not implemented yet, might never be xD too hard
	
	return sqran
end

function SquirrelAnim:setSpeed(speed) -- takes same speed as TPS's moveSpeed (Not implemented)
	sa.speed = speed
end

function SquirrelAnim:moveFrame()
	if frame < 11 then
		--self.deltapos_body:setPosition(0, ((frame/10) * 0.1), 0)
		--self.deltapos_fl:setPosition(math.sin(self.position.rotation[1])*((frame/10)*0.2), ((frame/10)*(-0.05)), math.cos(self.position.rotation[1])*((frame/10)*0.2))
		--self.deltapos_bl:setPosition(math.sin(self.position.rotation[1])*((frame/10)*0.1), ((frame/10)*(-0.03)), math.cos(self.position.rotation[1])*((frame/10)*0.1))
		self.deltapos_body:setRotation(math.rad((frame/10) * -5), 0, 0)
		self.deltapos_fl:setRotation(math.rad((frame/10) * -15), 0, 0)
		self.deltapos_bl:setRotation(math.rad((frame/10) * 5), 0, 0)
	end
	if frame == 45 then
		frame = 0
	end
	frame = frame + 1
end

function SquirrelAnim:reset() -- Resets the squirrel to "standing"
	self.deltapos_body:setPosition(0, 0, 0)
	self.deltapos_fl:setPosition(0, 0, 0)
	self.deltapos_bl:setPosition(0, 0, 0)
	self.deltapos_body:setRotation(0, 0, 0)
	self.deltapos_fl:setRotation(0, 0, 0)
	self.deltapos_bl:setRotation(0, 0, 0)
	frame = 1
end

function SquirrelAnim:drawFrame()
	self.body.position:setPosition(self.position.position[1] + self.deltapos_body.position[1],
								   self.position.position[2] + self.deltapos_body.position[2],
								   self.position.position[3] + self.deltapos_body.position[3])
	self.frontlegs.position:setPosition(self.position.position[1] + self.deltapos_fl.position[1],
										self.position.position[2] + self.deltapos_fl.position[2],
										self.position.position[3] + self.deltapos_fl.position[3])
	self.backlegs.position:setPosition(self.position.position[1] + self.deltapos_bl.position[1],
									   self.position.position[2] + self.deltapos_bl.position[2],
									   self.position.position[3] + self.deltapos_bl.position[3])
	self.body.position:setRotation(self.position.rotation[1] + self.deltapos_body.rotation[1],
								   self.position.rotation[2] + self.deltapos_body.rotation[2],
								   self.position.rotation[3] + self.deltapos_body.rotation[3])
	self.frontlegs.position:setRotation(self.position.rotation[1] + self.deltapos_fl.rotation[1],
										self.position.rotation[2] + self.deltapos_fl.rotation[2],
										self.frontlegs.position.rotation[3] + self.deltapos_fl.rotation[3])
	self.backlegs.position:setRotation(self.position.rotation[1] + self.deltapos_bl.rotation[1],
									   self.position.rotation[2] + self.deltapos_bl.rotation[2],
									   self.position.rotation[3] + self.deltapos_bl.rotation[3])
									   
	self.body:update()
	self.frontlegs:update()
	self.backlegs:update()
	
	self.body.model:blit()
	self.frontlegs.model:blit()
	self.backlegs.model:blit()
end