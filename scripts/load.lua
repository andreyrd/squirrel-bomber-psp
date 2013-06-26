dofile('scripts/classes/loadscreen.lua')

--Load Classes:
dofile("scripts/classes/vector.lua")
dofile("scripts/classes/collisiondata.lua")
dofile("scripts/classes/object.lua")
dofile("scripts/classes/camera.lua")
dofile("scripts/classes/light.lua")
dofile("scripts/classes/cameramanager.lua")
dofile("scripts/classes/lightmanager.lua")
dofile("scripts/classes/environment.lua")

--Competition rules require Neoflash splash screen to come first :P lame...will add once i finish splash class
os.luadevsplash()

splashtest = LoaderScreen.create(0)

splashtest:setFadeSpeed(5)

splashtest:setSplash(image.load('images/splash/neosplash.png'))


--The crossfade doesn't look so hot :/
splashtest:crossFade(image.load('images/splash/game_splash.png'))

splashtest:fadeOut()

splashtest:clearSplash()