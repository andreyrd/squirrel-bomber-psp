forest1splash = LoaderScreen.create(0)
forest1splash:setFadeSpeed(8.5)
forest1splash:setSplash(image.load('images/splash/game_splash.png'))
forest1splash:setObjects(26)

Cam = Camera.create()
	forest1splash:incrementPercent()
Cam.position:setPosition(0, 20, 0)
	forest1splash:incrementPercent()

TreeModel = model.load("objects/treebase.obj")
	forest1splash:incrementPercent()
TreeMap = {{-30,0,0},{30,0,0},{0,0,30}}
Trees = {}
for a = 1, #TreeMap, 1 do
	table.insert(Trees, Object.create(TreeModel))
	Trees[a].position:setPosition(TreeMap[a][1], TreeMap[a][2], TreeMap[a][3])
	Trees[a].collider:setData({{-(10)/2, 0, -(10)/2}, {10, 10, 10}})
	Trees[a]:update()
end
	forest1splash:incrementPercent()

Floor = Object.create(model.load("objects/forestfloor.obj"))
	forest1splash:incrementPercent()
Floor.position:setPosition(2, 0, 0)
	forest1splash:incrementPercent()
Floor:update()
	forest1splash:incrementPercent()
	
AcornObject = Object.create(model.load("objects/acorn.obj"))
	forest1splash:incrementPercent()
AcornObject.collider:setData({{-(2.255)/2, 0, -(2.255)/2}, {2.255, 2.255, 2.255}})
	forest1splash:incrementPercent()
AcornObject.position:setPosition(0, 0, 0)
	forest1splash:incrementPercent()
AcornObject:update()
	forest1splash:incrementPercent()
	
Atmosphere = Environment.create()
	forest1splash:incrementPercent()
Atmosphere:setLights(true) --Enables lights
	forest1splash:incrementPercent()
Atmosphere:setAmbient(color.new(255, 255, 255)) --Sets the ambient color
	forest1splash:incrementPercent()
Atmosphere:setSpecular(4.04) --sets the specular strength
	forest1splash:incrementPercent()
Atmosphere:setFogNear(40) --Sets where fog starts
	forest1splash:incrementPercent()
Atmosphere:setFogFar(50) --And where it ends
	forest1splash:incrementPercent()
Atmosphere:setFogColor(color.new(255, 255, 255)) --And the color of fog
	forest1splash:incrementPercent()
Atmosphere:update()
	forest1splash:incrementPercent()

light = Light.create()
	forest1splash:incrementPercent()
light:enable()
	forest1splash:incrementPercent()
light:setType(2)
	forest1splash:incrementPercent()
light:setDiffuse(color.new(0,0,0))
	forest1splash:incrementPercent()
light:setAmbient(color.new(255,255,255))
	forest1splash:incrementPercent()
light.position:setPosition(0,5,0)
	forest1splash:incrementPercent()
light:update()
	forest1splash:incrementPercent()
	
forest1splash:fadeOut()
forest1splash:clearSplash()

world.update()

while true do
	controls.read()
	
	Cam:lookAtPosition(AcornObject.position)
	Cam:setView()
	
	Floor:update()
	Floor.model:blit()
	
	AcornObject:update()
	AcornObject.model:blit()
	
	for a = 1, #Trees, 1 do
		Trees[a]:update()
		Trees[a].model:blit()
	end
	
	if controls.left() then
		AcornObject.position:setPosition(AcornObject.position.position[1] - 0.1, AcornObject.position.position[2], AcornObject.position.position[3])
	end
	if controls.right() then
		AcornObject.position:setPosition(AcornObject.position.position[1] + 0.1, AcornObject.position.position[2], AcornObject.position.position[3])
	end
	if controls.up() then
		AcornObject.position:setPosition(AcornObject.position.position[1], AcornObject.position.position[2], AcornObject.position.position[3] + 0.1)
	end
	if controls.down() then
		AcornObject.position:setPosition(AcornObject.position.position[1], AcornObject.position.position[2], AcornObject.position.position[3] - 0.1)
	end
	
	screen.flip()
	screen.waitvblank()
end