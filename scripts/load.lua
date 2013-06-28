dofile('scripts/classes/loadscreen.lua')

splashtest = LoaderScreen.create(0)

splashtest:setFadeSpeed(8.5)

splashtest:setSplash(image.load('images/splash/neosplash.png'))

splashtest:setObjects(10)

--Load Classes:
dofile("scripts/classes/vector.lua")
splashtest:incrementPercent()
dofile("scripts/classes/collisiondata.lua")
splashtest:incrementPercent()
dofile("scripts/classes/object.lua")
splashtest:incrementPercent()
dofile("scripts/classes/camera.lua")
splashtest:incrementPercent()
dofile("scripts/classes/light.lua")
splashtest:incrementPercent()
dofile("scripts/classes/cameramanager.lua")
splashtest:incrementPercent()
dofile("scripts/classes/lightmanager.lua")
splashtest:incrementPercent()
dofile("scripts/classes/environment.lua")
splashtest:incrementPercent()
dofile("scripts/classes/menu.lua")
splashtest:incrementPercent()

splashtest:crossFade(image.load('images/splash/game_splash.png'))

splashtest:incrementPercent()

splashtest:fadeOut()

splashtest:clearSplash()