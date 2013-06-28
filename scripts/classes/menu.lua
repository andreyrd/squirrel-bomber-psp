Menu = {}
Menu.__index = Menu

function Menu.create()
	local menu = {}
	setmetatable(menu, Menu)
	
	menu.Items = {}
	menu.selected = 1
	
	menu.itemSpacing = 10
	
	menu.x = 115
	menu.y = 21
	
	menu.font = nil
	
	menu.selectedColor = color.new(0, 255, 0)
	menu.unselectedColor = color.new(255, 255, 255)
	
	menu.pagenumColor = color.new(255, 255, 255)
	
	menu.item_bg = image.load('images/menus/plank.png') -- Image behind the menu item. 150 x 30 px.
	
	return menu
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
	page = math.ceil(self.selected / 4)
	pages = math.ceil(#self.Items / 4)
	if (page < pages) then
		n = 0
		for a = (page * 4) - 3 , (page * 4), 1 do
			n = n + 1
			image.blit(self.item_bg, self.x, self.y + (n - 1) * (50 + self.itemSpacing))
			if a~=self.selected then
				screen.print(self.x + 125 - 6 * string.len(self.Items[a][1]),
							 self.y + 20 + (n - 1) * (50 + self.itemSpacing),
							 self.Items[a][1],
							 self.unselectedColor)
			end
		end
	end
	n = 0
	if (page == pages) then
		for a = (page * 4) - 3, #self.Items, 1 do
			n = n + 1
			image.blit(self.item_bg, self.x, self.y + (n - 1) * (50 + self.itemSpacing))
			if a~=self.selected then
				screen.print(self.x + 125 - 6 * string.len(self.Items[a][1]),
							 self.y + 20 + (n - 1) * (50 + self.itemSpacing),
							 self.Items[a][1],
							 self.unselectedColor)
			end
		end
	end
	n = self.selected - ((page - 1) * 4)
	screen.print(self.x + 125 - 6 * string.len(self.Items[self.selected][1]), 
				 self.y + 20 + (n - 1) * (50 + self.itemSpacing), 
				 self.Items[self.selected][1], 
				 self.selectedColor)
	screen.print(450, 258, page.."/"..pages, self.pagenumColor)
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