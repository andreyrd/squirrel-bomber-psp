-- Get the splash and loading screen functions ready

-- Splash screen images should be 480x252 px and we'll make the loading bar 480x20 at the bottom

LoaderScreen = {}
LoaderScreen.__index = LoaderScreen

function LoaderScreen.create(percent) -- use percent here to jump there without animation
	local lscreen = {}
	setmetatable(lscreen, LoaderScreen)
	
	lscreen.splash = nil -- image shown above loading bar
	lscreen.percent = percent or nil -- percent loading completed
	lscreen.old_percent = nil -- used when animating bar
	
	return lscreen;
end

function LoaderScreen:setSplash(new_splash) -- set a new splash, will fade it too :D
	splash = new_splash
	
	for a = 0, 255, 5 do
		image.blend(splash, 0, 0, a)
		screen.flip()
		screen.waitvblankstart()
	end
end

function LoaderScreen:setPercent(new_percent) -- kindly changes and even animates a new percent loading done
	old_percent = self.percent
	percent = new_percent
	--funky tileset animation
end

