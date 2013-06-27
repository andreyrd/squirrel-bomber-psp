Menu = {}
Menu.__index = Menu

function Menu.create(id)
	local menu = {}
	setmetatable(menu, Menu)
	
	menu.id = id
	menu.Items = {}
	menu.selected = 1
	
	menu.textSpacing = 15
	menu.center = false
	
	menu.x = 0
	menu.y = 0
	
	menu.font = nil
	
	menu.selectedColor = color.new(0, 255, 0)
	menu.unselectedColor = color.new(255, 255, 255)
	
	return menu
end

function Menu:setPosition(x, y)
	self.x = x
	self.y = y
end

function Menu:setSelectedColor(color)
	self.selectedColor = color
end

function Menu:setUnselectedColor(color)
	self.unselectedColor = color
end

function Menu:addItem(title, script)
	table.insert(self.Items, {title, script})
end

function Menu:removeItem(id)
	table.remove(self.Items, id or #self.Items)
end

function Menu:drawFrame() -- Draws one frame of our menu
	for a=1, #self.Items, 1 do
		if a ~= self.selected then
			screen.print(self.x, self.y + a * self.textSpacing - self.textSpacing + 5, self.Items[a][1], self.unselectedColor)
		end
	end
	screen.print(self.x, (self.selected)*self.textSpacing - self.textSpacing + 5, self.Items[self.selected][1], self.selectedColor)
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