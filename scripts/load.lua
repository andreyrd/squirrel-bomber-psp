dofile('scripts/load_splashes.lua')

--Competition rules require Neoflash splash screen to come first :P lame...will add once i finish splash class
os.luadevsplash()

splashtest = LoaderScreen.create(0)
splashtest:setSplash(image.load('images/splash/neosplash.png'))
for x=1000,0,-5 do
 -- hack stuff
end
splashtest:setSplash(image.load('images/splash/game_splash.png'))
