dofile('scripts/classes/loadscreen.lua')

--Load Classes:
dofile("scripts/classes/vector.lua")
dofile("scripts/classes/collisiondata.lua")
dofile("scripts/classes/object.lua")
dofile("scripts/classes/camera.lua")

--Competition rules require Neoflash splash screen to come first :P lame...will add once i finish splash class
os.luadevsplash()

splashtest = LoaderScreen.create(0)

splashtest:setFadeSpeed(5)

splashtest:setSplash(image.load('images/splash/neosplash.png'))

splashtest:fadeOut()

for x=1000,0,-5 do
 -- hack stuff 
 --Er... What stuff?
end
splashtest:setSplash(image.load('images/splash/game_splash.png'))

splashtest:fadeOut()

splashtest:clearSplash()