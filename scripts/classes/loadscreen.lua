--Requires:

-- Get the splash and loading screen functions ready

-- Splash screen images should be 480x252 px and we'll make the loading bar 480x20 at the bottom

LoaderScreen = {}
LoaderScreen.__index = LoaderScreen

function LoaderScreen.create(percent) -- use percent here to jump there without animation
	local lscreen = {}
	setmetatable(lscreen, LoaderScreen)
	
	lscreen.splash = nil -- image shown above loading bar
	lscreen.percent = percent or nil -- percent loading completed
	lscreen.oldPercent = nil -- used when animating bar
	lscreen.fadespeed = 5
	lscreen.loader_leaf = image.load('images/loader/leaf.png')
	
	return lscreen;
end

function LoaderScreen:setFadeSpeed(Speed)
	self.fadespeed = Speed
end

function LoaderScreen:setSplash(new_splash) -- set a new splash, will fade it in too :D
	self.splash = new_splash
	
	for a = 0, 255, self.fadespeed do
		image.blend(self.splash, 0, 0, a)
		rect_r = a / 2.55 -- these are used for a brown fade for the loading rectangle
		rect_g = a / 5.1
		self:drawPercent()
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

function LoaderScreen:drawPercent(percent) -- draw a single frame of the loading bar with splash of course
	image.blit(self.splash, 0, 0)
	draw.fillrect(0, 252, 480, 20, color.new(100, 50, 0))
	draw.fillrect(0, 252, 480*((percent or self.percent)/100), 20, color.new(0, 200, 0))
	image.blit(self.loader_leaf, 480*((percent or self.percent)/100)-10, 252)
end

function LoaderScreen:fadeOut()
	for a = 255, 0 , -self.fadespeed do
		image.blend(self.splash, 0, 0, a)
		self:drawPercent()
		screen.flip()
		screen.waitvblankstart()
	end
end

function LoaderScreen:crossFade(newImage) -- Crossfades in a new splash
	for a = 0, 255, self.fadespeed do
		image.blend(self.splash, 0, 0, (a * -1 + 255))
		image.blend(newImage, 0, 0, a)
		self:drawPercent()
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