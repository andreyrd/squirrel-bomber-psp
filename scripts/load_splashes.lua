-- Get the splash screen functions ready

-- Splash screen for NeoFlash competition

function neoSplashIn()
	neo_splash = image.load("images/splash/neosplash.png")
	
	for a = 0, 255, 5 do
		image.blend(neo_splash, 0, 0, a)
		screen.flip()
		screen.waitvblankstart()
	end
end

function neoSplashOut()
	for a = 255, 0, -5 do
		image.blend(neo_splash, 0, 0, a)
		screen.flip()
		screen.waitvblankstart()
	end
	neo_splash:free()
	game_splash = nil
	collectgarbage()
end

-- Now for the game's loading screen

function gameSplashIn()
	game_splash = image.load("images/splash/game_splash.png")
	--loader_squirrel1 = image.load("images/loader/squirrel1.png")
	--loader_squirrel2 = image.load("images/loader/squirrel2.png")
	loader_nutbar = image.load("images/loader/loader_nutbar.png")
	
	image.blend(game_splash, 0, 0, 255)
	image.blend(loader_nutbar, 0, 232, 255) --There's some way to use tilesets... We maybe able to animate this easily...
	
	