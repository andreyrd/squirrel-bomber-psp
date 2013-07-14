AnimationManager = {}
AnimationManager.__index = AnimationManager

function AnimationManager.create()
	local am = {}
	setmetatable(am, AnimationManager)
	
	am.Objects = {}
	
	return am
end

function AnimationManager:addAnimation(Object, id)
	self.Objects[id] = Object
end

function AnimationManager:play(id)
	self.Objects[id]:play()
end

function AnimationManager:blit(id)
	self.Objects[id]:blit()
end