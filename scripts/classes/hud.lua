HUD = {}
HUD.__index = HUD

function HUD.create()
	local hud = {}
	setmetatable(hud, HUD)
	
	Items = {}

	return hud
end

function HUD:addItem(Image, x, y, alpha)
	table.insert(self.Items, {Image, x, y, alpha})
	return #Items
end

function HUD:removeItem(id)
	table.remove(self.Items, id)
end

function HUD:setItemProperties(id, x, y, Alpha)
	self.Items[id][2] = x
	self.Items[id][3] = y
	self.Items[id][4] = Alpha
end

function HUD:drawItems()
	for a = #self.Items do
		screen.blend(self.Items[a][1], self.Items[a][2], self.Items[a][3]. self.Items[a][4])
	end
end