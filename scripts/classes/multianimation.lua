MultiAnimation = {}
MultiAnimation.__index = MultiAnimation

function MultiAnimation.create()
	local ma = {}
	setmetatable(ma, MultiAnimation)
	
	ma.Objects = {}
	ma.Type = 1 --1 = AnimationObjects, 2 = Animation Managers
	
	return ma
end

function MultiAnimation:addObject(obj)
	table.insert(self.Objects, obj)
end

function MultiAnimation:setType(n)
	self.Type = n
end

function MultiAnimation:play(id)
	if self.Type == 2 then
		for a = 1, #self.Objects do
			self.Objects[a]:play(id)
		end
	else
		for a = 1, #self.Objects do
			self.Objects[a]:play()
		end
	end
end

function MultiAnimation:blit()
	--Why did I split these up? Lord knows...
	if self.Type == 2 then
		for a = 1, #self.Objects do
			self.Objects[a]:blit()
		end
	else
		for a = 1, #self.Objects do
			self.Objects[a]:blit()
		end
	end
end