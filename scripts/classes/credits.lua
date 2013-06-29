-- A class for creating rolling credits. Might be nice to be able to reuse this :)

Credits = {}
Credits.__index = Credits

function Credits.create()
	local credits = {}
	setmetatable(credits, Credits)
	
	credits.Items = {}
	credits.scrollSpeed = 1
	credits.align = 2 -- 1-left, 2-center, 3-right
	credits.direction = -1 -- negative-down, positive-up
	credits.posY = 0
	credits.lineSpacing = 2
	credits.marginLeft = 5 -- Margins only affect left/right align
	credits.marginRight = 5
	
	return credits
end

function Credits:calcInitPosY()
	self.posY = ((#self.Items * 15) + ((#self.Items - 1) * self.lineSpacing)) * self.direction
end

function Credits:setAlign(align) -- 1-left, 2-center, 3-right
	self.align = align
end

function Credits:setDirection(direction) -- -1 = down, 1 = up
	self.direction = direction
	self:calcInitPosY()
end

function Credits:setLineSpacing(lineSpacing)
	self.lineSpacing = lineSpacing
	self:calcInitPosY()
end

function Credits:setMargins(left, right)
	self.marginLeft = left
	self.marginRight = right
end

function Credits:setMarginLeft(left)
	self.marginLeft = left
end

function Credits:setMarginRight(right)
	self.marginRight = right
end

function Credits:setScrollSpeed(speed)
	self.scrollSpeed = speed
end

function Credits:addItem(text)
	-- Please add/remove all items before doing any scrolling
	-- I'm going to eventually add support for mid-scroll changes
	table.insert(self.Items, text)
	self:calcInitPosY()
	return #self.Items
end

function Credits:removeItem(id)
	table.remove(self.Items, id or #self.Items)
	self:calcInitPosY()
	return #self.Items
end

function Credits:scrollFrame()
	self.posY = self.posY - self.scrollSpeed * self.direction
end

function Credits:drawFrame()
	for a = 1, #self.Items, 1 do
		if (self.align == 1) then
			posX = 0 + self.marginLeft
		end
		if (self.align == 2) then
			posX = 240 - screen.textwidth(self.Items[a]) / 2
		end
		if (self.align == 3) then
			posX = 480 - screen.textwidth(self.Items[a]) - self.marginRight
		end
		screen.print(posX, self.posY + (a * 15) + (a-1) * self.lineSpacing, self.Items[a])
	end
end

function Credits:doneScrolling()
	if direction == 1 then
		if self.posY < (-1 * ((#self.Items * 15) + ((#self.Items - 1) * self.lineSpacing))) then
			return true
		end
	end
	if direction == -1 then
		if self.posY > (480 + (#self.Items * 15) + ((#self.Items - 1) * self.lineSpacing)) then
			return true
		end
	end
	return false
end