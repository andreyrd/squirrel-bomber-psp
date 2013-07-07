SquirrelAnim = {}
SquirrelAnim.__index = SquirrelAnim

function SquirrelAnim.create()
	local sa = {}
	setmetatable(sa, SquirrelAnim)
	
	sa.body = Object.create(model.load('objects/squirrel_body.obj'))
	sa.frontlegs = Object.create(model.load('objects/squirrel_frontlegs.obj'))
	sa.backlegs = Object.create(model.load('objects/squirrel_backlegs.obj'))
	
	sa.deltapos_body = Vector.create()
	sa.deltapos_fl = Vector.create()
	sa.deltapos_bl = Vector.create()
	
	sa.position = Vector.create()
	
	sa.frame = 1
	sa.speed = 5 -- Not implemented yet
	
	return sa
end

function SquirrelAnim:setSpeed(speed) -- takes same speed as TPS's moveSpeed (Not implemented)
	sa.speed = speed
end

function SquirrelAnim:moveFrame()
	if frame < 11 then
		self.deltapos_body:setPosition(0, ((frame/10) * 0.1), 0)
		self.deltapos_fl:setPosition(sin(self.position.rotation[1])*((frame/10)*0.1), ((frame/10)*(-0.1)), cos(self.position.rotation[1])*((frame/10)*0.1))
		self.deltapos_bl:setPosition(sin(self.position.rotation[1])*((frame/10)*0.4), ((frame/10)*(-0.05)), cos(self.position.rotation[1])*((frame/10)*0.4))
	end
	if frame == 45 then
		frame = 0
	end
	frame = frame + 1
end

function SquirrelAnim:drawFrame()
	