--[[ This is Messy. It needs organized ]]--

forest1splash = LoaderScreen.create(0)
forest1splash:setFadeSpeed(8.5)
forest1splash:setSplash(image.load('images/splash/game_splash.png'))
forest1splash:setObjects(27)

TreeModel = model.load("objects/treebase.obj", 0.15, color.new(0, 0, 0))
	forest1splash:incrementPercent()
TreeMap = {{-30,0,0},{30,0,0},{0,0,30}}
Trees = {}

for a = 1, #TreeMap, 1 do
	table.insert(Trees, Object.create(TreeModel))
	Trees[a].position:setPosition(TreeMap[a][1], TreeMap[a][2], TreeMap[a][3])
	Trees[a].collider:setData({{-(10)/2, 0, -(10)/2}, {10, 15, 10}})
	Trees[a]:update()
end
	forest1splash:incrementPercent()

Floor = Object.create(model.load("objects/forestfloor.obj"))
	forest1splash:incrementPercent()
Floor.position:setPosition(2, 0, 0)
	forest1splash:incrementPercent()
Floor:update()
	forest1splash:incrementPercent()

Player = TPSController.create(model.load("objects/acorn.obj", 0.15, color.new(0, 0, 0)))
	forest1splash:incrementPercent()
Player.object.collider:setData({{-(2.255)/2, 0, -(2.255)/2}, {2.255, 2.255, 2.255}})
	forest1splash:incrementPercent()
Player.object:update()
	forest1splash:incrementPercent()
Player:setCameraCollider({{-2, 0, -2}, {2, 2, 2}})
	
Atmosphere = Environment.create()
	forest1splash:incrementPercent()
Atmosphere:setLights(true) --Enables lights
	forest1splash:incrementPercent()
Atmosphere:setAmbient(color.new(255, 255, 255)) --Sets the ambient color
	forest1splash:incrementPercent()
Atmosphere:setSpecular(4.04) --sets the specular strength
	forest1splash:incrementPercent()
Atmosphere:setFogNear(10) --Sets where fog starts
	forest1splash:incrementPercent()
Atmosphere:setFogFar(30) --And where it ends
	forest1splash:incrementPercent()
Atmosphere:setFogColor(color.new(0, 0, 61)) --And the color of fog ?? WHITE?
	forest1splash:incrementPercent()
Atmosphere:update()
	forest1splash:incrementPercent()

light = Light.create()
light:setId(1)
	forest1splash:incrementPercent()
light:enable()
	forest1splash:incrementPercent()
light:setType(2)
	forest1splash:incrementPercent()
light:setDiffuse(color.new(0,0,0))
	forest1splash:incrementPercent()
light:setAmbient(color.new(255,255,255))
	forest1splash:incrementPercent()
light.position:setPosition(0,10,0)
	forest1splash:incrementPercent()
light:update()
	forest1splash:incrementPercent()

controls.analogtodigital(50)
	forest1splash:incrementPercent()
	
forest1splash:fadeOut()
forest1splash:clearSplash()

world.update()

while true do
	screen.clear(color.new(0, 0, 61))
	controls.read()
	
	world.update()
	
	Player.camera:setView()
	Player:update()
	
	Player.object:update()
	Player.object.model:blit()
	
	APos = Player.object.position.position
	BPos = Player.camera.position.position
	CCPos = Player.cameraCollider.position.position
	
	Floor:update()
	Floor.model:blit()
	
	for a = 1, #Trees, 1 do
		Trees[a]:update()
		Trees[a].model:blit()
	end
		
	screen.print(0, 2, "FPS: " .. screen.fps(), color.new(255, 255, 255))
	screen.print(0, 16, "Player: (" .. APos[1] .. ", " .. APos[2] .. ", " .. APos[3] .. ")", color.new(255, 255, 255))
	screen.print(0, 30, "Camera: (" .. BPos[1] .. ", " .. BPos[2] .. ", " .. BPos[3] .. ")", color.new(255, 255, 255))
	screen.print(0, 44, "Camera Collider: (" .. CCPos[1] ..", " .. CCPos[2] .. ", " .. CCPos[3] .. ")", color.new(255, 255, 255))
	screen.print(0, 58, "Collision:", color.new(255, 255, 255))
	
	if controls.select() then
		error("USB Mode")
	end
	
	collision_cam = 0
	collision_plyr = 0 -- Just testing these
	
	for a = 1, #Trees, 1 do
		if Player.object.collider:checkCollision(Trees[a].collider) then
			collision_plyr = 1
			break
		end
	end
	
	for a = 1, #Trees, 1 do
		if Player.cameraCollider:checkCollision(Trees[a].collider) then
			collision_cam = 1
			break
		end
	end
	
	if collision_cam == 1 then
		Player.camera.position:stepBack({true, true})
		screen.print(20, 58, "Camera", color.new(255,255,255))
	end
	
	if collision_plyr == 1 then
		Player.object.position:stepBack({true, false})
		screen.print(40, 58, "Player", color.new(255,255,255))
	end
	
	screen.flip()
	screen.waitvblank()
end