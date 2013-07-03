nestsplash = LoaderScreen.create(0)
nestsplash:setFadeSpeed(5)
nestsplash:setSplash(image.load('images/splash/game_splash.png'))
nestsplash:setObjects(19)

Nest = Object.create(model.load("objects/nest.obj"))
	nestsplash:incrementPercent()
Nest:update()
	nestsplash:incrementPercent()
Player = FPSController.create()
	nestsplash:incrementPercent()
Player.position:setPosition(0, 2, 0)

Atmosphere = Environment.create()
	nestsplash:incrementPercent()
Atmosphere:setLights(true) --Enables lights
	nestsplash:incrementPercent()
Atmosphere:setAmbient(color.new(255, 255, 255)) --Sets the ambient color
	nestsplash:incrementPercent()
Atmosphere:setSpecular(4.04) --sets the specular strength
	nestsplash:incrementPercent()
Atmosphere:setFogNear(10) --Sets where fog starts
	nestsplash:incrementPercent()
Atmosphere:setFogFar(20) --And where it ends
	nestsplash:incrementPercent()
Atmosphere:setFogColor(color.new(1, 102, 0.5)) --And the color of fog ?? WHITE?
	nestsplash:incrementPercent()
Atmosphere:update()
	nestsplash:incrementPercent()

light = Light.create()
light:setId(1)
	nestsplash:incrementPercent()
light:enable()
	nestsplash:incrementPercent()
light:setType(2)
	nestsplash:incrementPercent()
light:setDiffuse(color.new(0,0,0))
	nestsplash:incrementPercent()
light:setAmbient(color.new(255,255,255))
	nestsplash:incrementPercent()
light.position:setPosition(0,5,0)
	nestsplash:incrementPercent()
light:update()

world.update()

nestsplash:fadeOut()
nestsplash:clearSplash()

while true do
	controls.read()
	
	Player:update()
	Player.camera:setView()
	
	Nest:update()
	Nest.model:blit()
	
	screen.flip()
	screen.waitvblankstart()
end