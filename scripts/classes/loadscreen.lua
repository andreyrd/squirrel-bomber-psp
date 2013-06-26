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
	
	return lscreen;
end

function LoaderScreen:setFadeSpeed(Speed)
	self.fadespeed = Speed
end

function LoaderScreen:setSplash(new_splash) -- set a new splash, will fade it too :D
	self.splash = new_splash
	
	for a = 0, 255, self.fadespeed do
		image.blend(self.splash, 0, 0, a)
		screen.flip()
		screen.waitvblankstart()
	end
end

function LoaderScreen:setPercent(newPercent) -- kindly changes and even animates a new percent loading done
	self.oldPercent = self.percent
	self.percent = newPercent
	--funky tileset animation
end

function LoaderScreen:fadeOut()
	for a = 255, 0 , -self.fadespeed do
		image.blend(self.splash, 0, 0, a)
		screen.flip()
		screen.waitvblankstart()
	end
end

function LoaderScreen:crossFade(newImage)
	for a = 0, 255, self.fadespeed do
		image.blend(self.splash, 0, 0, (a * -1 + 255) * -1)
		image.blend(newImage, 0, 0, a)
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