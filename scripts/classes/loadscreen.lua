--Requires:

-- Get the splash and loading screen functions ready

-- Splash screen images should be 480x272 px but please take a look at where the loading bar / animation will be :)

LoaderScreen = {}
LoaderScreen.__index = LoaderScreen

function LoaderScreen.create(percent) -- use percent here to jump there without animation
	local lscreen = {}
	setmetatable(lscreen, LoaderScreen)
	
	lscreen.splash = nil
	lscreen.percent = percent or nil -- percent loading completed
	lscreen.oldPercent = nil -- used when animating bar
	lscreen.fadespeed = 5
	lscreen.loader_leaf = image.load('images/loader/leaf.png')
	
	lscreen.loadObjects = 0
	lscreen.increment = 0
	
	return lscreen;
end

function LoaderScreen:setObjects(n)
	self.loadObjects = n
	self.increment = 100 / self.loadObjects
end

function LoaderScreen:setFadeSpeed(Speed)
	self.fadespeed = Speed
end

function LoaderScreen:setSplash(new_splash) -- set a new splash, will fade it in too :D
	self.splash = new_splash
	
	for a = 0, 255, self.fadespeed do
		image.blend(self.splash, 0, 0, a)
		self:drawPercentNoSplash()
		screen.flip()
		screen.waitvblankstart()
	end
end

function LoaderScreen:setPercent(newPercent) -- kindly changes and even animates a new percent loading done
	self.oldPercent = self.percent
	self.percent = newPercent
	for a = self.oldPercent, self.percent, 1 do
		self:drawPercent(a)
		screen.flip()
		screen.waitvblankstart()
	end
end

function LoaderScreen:incrementPercent(amount)
	self:setPercent(self.percent + (amount or self.increment))
end

function LoaderScreen:drawPercent(percent) -- draw a single frame of the loading bar with splash of course
	image.blit(self.splash, 0, 0)
	draw.fillrect(384, 251, 82, 6, color.new(0, 0, 0))
	draw.fillrect(385, 252, 80, 4, color.new(100, 50, 0))
	draw.fillrect(385, 252, 80*((percent or self.percent)/100), 4, color.new(0, 200, 0))
	image.rotate(self.loader_leaf, (percent or self.percent)*15)
	image.blit(self.loader_leaf, 370, 252)
end

function LoaderScreen:drawPercentNoSplash(percent) -- draw a single frame of the loading bar with splash of course
	draw.fillrect(384, 251, 82, 6, color.new(0, 0, 0))
	draw.fillrect(385, 252, 80, 4, color.new(100, 50, 0))
	draw.fillrect(385, 252, 80*((percent or self.percent)/100), 4, color.new(0, 200, 0))
	image.rotate(self.loader_leaf, (percent or self.percent)*15)
	image.blit(self.loader_leaf, 370, 252)
end

function LoaderScreen:fadeOut()
	for a = 255, 0 , -self.fadespeed do
		image.blend(self.splash, 0, 0, a)
		self:drawPercentNoSplash(100)
		screen.flip()
		screen.waitvblankstart()
	end
end

function LoaderScreen:crossFade(newImage) -- Crossfades in a new splash
	for a = 0, 255, self.fadespeed do
		image.blend(self.splash, 0, 0, (a * -1 + 255))
		image.blend(newImage, 0, 0, a)
		self:drawPercentNoSplash()
		screen.flip()
		screen.waitvblankstart()
	end
	self.splash = newImage
end

function LoaderScreen:clearSplash()
	if self.splash ~= nil then
		self.splash:free()
		self.splash = nil
		collectgarbage()
	end
end