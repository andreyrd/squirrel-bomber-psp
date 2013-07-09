dofile('scripts/classes/loadscreen.lua')

loadsplash = LoaderScreen.create(0)

loadsplash:setFadeSpeed(8.5)

loadsplash:setSplash(image.load('images/splash/neosplash.png'))

loadsplash:setObjects(15)

--Load Classes:
dofile("scripts/classes/vector.lua")
loadsplash:incrementPercent()
dofile("scripts/classes/collisiondata.lua")
loadsplash:incrementPercent()
dofile("scripts/classes/object.lua")
loadsplash:incrementPercent()
dofile("scripts/classes/camera.lua")
loadsplash:incrementPercent()
dofile("scripts/classes/light.lua")
loadsplash:incrementPercent()
dofile("scripts/classes/cameramanager.lua")
loadsplash:incrementPercent()
dofile("scripts/classes/squirrelanim.lua")
loadsplash:incrementPercent()

loadsplash:crossFade(image.load('images/splash/game_splash.png'))

dofile("scripts/classes/lightmanager.lua")
loadsplash:incrementPercent()
dofile("scripts/classes/environment.lua")
loadsplash:incrementPercent()
dofile("scripts/classes/keys.lua")
loadsplash:incrementPercent()
dofile("scripts/classes/fpscontroller.lua")
loadsplash:incrementPercent()
dofile("scripts/classes/tpscontroller.lua")
loadsplash:incrementPercent()
dofile("scripts/classes/menu.lua")
loadsplash:incrementPercent()
dofile("scripts/classes/credits.lua")
loadsplash:incrementPercent()

loadsplash:fadeOut()

loadsplash:clearSplash()