dofile('scripts/classes/loadscreen.lua')

splashtest = LoaderScreen.create(0)

splashtest:setFadeSpeed(5)

splashtest:setSplash(image.load('images/splash/neosplash.png'))

--Load Classes:
dofile("scripts/classes/vector.lua")
splashtest:setPercent(5)
dofile("scripts/classes/collisiondata.lua")
splashtest:setPercent(15)
dofile("scripts/classes/object.lua")
splashtest:setPercent(30)
dofile("scripts/classes/camera.lua")
splashtest:setPercent(40)
dofile("scripts/classes/light.lua")
splashtest:setPercent(50)
dofile("scripts/classes/cameramanager.lua")
splashtest:setPercent(55)
dofile("scripts/classes/lightmanager.lua")
splashtest:setPercent(60)
dofile("scripts/classes/environment.lua")
splashtest:setPercent(70)
dofile("scripts/classes/menu.lua")
splashtest:setPercent(80)


--The crossfade doesn't look so hot :/
splashtest:crossFade(image.load('images/splash/game_splash.png'))

splashtest:setPercent(100)

splashtest:fadeOut()

splashtest:clearSplash()