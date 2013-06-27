Menu = {}
Menu.__index = Menu

function Menu.create(id)
	local menu = {}
	setmetatable(menu, Menu)
	
	menu.id = id
	menu.Items = {}
	menu.selected = 1
	
	return menu
end

function Menu:addItem(title, script)
	table.insert(self.Items, {title, script})
end

function Menu:removeItem(id)
	table.remove(self.Items, id or #self.Items)
end

function Menu:drawFrame() -- Draws one frame of our menu
	for a=1, #self.Items, 1 do
		screen.print(0, a*15+5, self.Items[a][1], color.new(255,255,255))
	end
	screen.print(0, (self.selected)*15+5, self.Items[self.selected][1], color.new(0,255,0))
end

function Menu:moveUp() -- Call this when you want to move up
	if self.selected > 1 then
		self.selected = self.selected - 1
	end
end

function Menu:moveDown() -- Moves down xD
	if self.selected < #self.Items then
		self.selected = self.selected + 1
	end
end

function Menu:executeSelected() -- Executes the selected item
	dofile(self.Items[self.selected][2])
end