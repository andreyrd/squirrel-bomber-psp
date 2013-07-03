--[[ This is Messy. It needs organized ]]--

forest1splash = LoaderScreen.create(0)
forest1splash:setFadeSpeed(8.5)
forest1splash:setSplash(image.load('images/splash/game_splash.png'))
forest1splash:setObjects(27)
inc = forest1splash:incrementPercent

TreeModel = model.load("objects/treebase.obj", 0.15, color.new(0, 0, 0))
	inc()
TreeMap = {{-30,0,0},{30,0,0},{0,0,30}}
Trees = {}

for a = 1, #TreeMap, 1 do
	table.insert(Trees, Object.create(TreeModel))
	Trees[a].position:setPosition(TreeMap[a][1], TreeMap[a][2], TreeMap[a][3])
	Trees[a].collider:setData({{-(10)/2, 0, -(10)/2}, {10, 10, 10}})
	Trees[a]:update()
end
	inc()

Floor = Object.create(model.load("objects/forestfloor.obj"))
	inc()
Floor.position:setPosition(2, 0, 0)
	inc()
Floor:update()
	inc()

Player = TPSController.create(model.load("objects/acorn.obj", 0.15, color.new(0, 0, 0)))
	inc()
Player.object.collider:setData({{-(2.255)/2, 0, -(2.255)/2}, {2.255, 2.255, 2.255}})
	inc()
Player.object:update()
	inc()
	
Atmosphere = Environment.create()
	inc()
Atmosphere:setLights(true) --Enables lights
	inc()
Atmosphere:setAmbient(color.new(255, 255, 255)) --Sets the ambient color
	inc()
Atmosphere:setSpecular(4.04) --sets the specular strength
	inc()
Atmosphere:setFogNear(20) --Sets where fog starts
	inc()
Atmosphere:setFogFar(30) --And where it ends
	inc()
Atmosphere:setFogColor(color.new(0, 0, 20)) --And the color of fog ?? WHITE?
	inc()
Atmosphere:update()
	inc()

light = Light.create()
light:setId(1)
	inc()
light:enable()
	inc()
light:setType(2)
	inc()
light:setDiffuse(color.new(0,0,0))
	inc()
light:setAmbient(color.new(255,255,255))
	inc()
light.position:setPosition(0,5,0)
	inc()
light:update()
	inc()

controls.analogtodigital(50)
	inc()
	
forest1splash:fadeOut()
forest1splash:clearSplash()

world.update()

while true do
	controls.read()
	
	world.update()
	
	Player.camera:setView()
	Player:update()
	
	Player.object:update()
	Player.object.model:blit()
	
	APos = Player.object.position.position
	BPos = Player.camera.position.position
	
	Floor:update()
	Floor.model:blit()
	
	for a = 1, #Trees, 1 do
		Trees[a]:update()
		Trees[a].model:blit()
	end
		
	screen.print(0, 2, "FPS: " .. screen.fps(), color.new(255, 255, 255))
	screen.print(0, 16, "Player: (" .. APos[1] .. ", " .. APos[2] .. ", " .. APos[3] .. ")", color.new(255, 255, 255))
	screen.print(0, 30, "Camera: (" .. BPos[1] .. ", " .. BPos[2] .. ", " .. BPos[3] .. ")", color.new(255, 255, 255))
	
	if controls.select() then
		error("USB Mode")
	end
	
	screen.flip()
	screen.waitvblank()
end