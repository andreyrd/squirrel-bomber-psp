Popup = {}
Popup.__index = Popup

function Popup.create()
	local pop = {}
	setmetatable(pop, Popup)
	
	pop.text = ""
	pop.font = nil
	
	pop.image = nil
	
	pop.time = 30
	pop.currenttime = 1
	
	pop.x = 0
	pop.y = 0
	
	return pop
end

function Popup:setText(text)
	self.text = text
end

function Popup:setPosition(x, y)
	self.x = x
	self.y = y
end

function Popup:setTime(n)
	self.time = n
end

function Popup:setFont(font)
	self.font = font
end

function Popup:update()
	if self.currenttime < self.time then
		if self.font ~= nil then
			screen.print(self.font, self.x, self.y, self.text, color.new(255, 255, 255))
		else
			screen.print(self.x, self.y, self.text, color.new(255, 255, 255))
		end
		self.time = self.time + 1
	end
end