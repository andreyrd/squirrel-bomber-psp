--[[ This is Messy. It needs organized ]]--

rad = math.rad

forest1splash = LoaderScreen.create(0)
forest1splash:setFadeSpeed(8.5)
forest1splash:setSplash(image.load('images/splash/game_splash.png'))
forest1splash:setObjects(27)

Cam = Camera.create()
	forest1splash:incrementPercent()
Cam.position:setPosition(1, 13, 0)
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
Atmosphere:setFogColor(color.new(1, 102, 0.5)) --And the color of fog ?? WHITE?
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
light.position:setPosition(0,5,0)
	forest1splash:incrementPercent()
light:update()
	forest1splash:incrementPercent()

controls.analogtodigital(50)
	forest1splash:incrementPercent()
	
forest1splash:fadeOut()
forest1splash:clearSplash()

world.update()

while true do
	controls.read()
	
	world.update()
	
	Cam.position:rotateTowards(AcornObject.position) --I'm using this to store the rotation
	
	Cam:lookAtPosition(AcornObject.position)
	Cam:setView()
	
	Floor:update()
	Floor.model:blit()
	
	AcornObject:update()
	AcornObject.model:blit()
	
	APos = AcornObject.position.position
	BPos = Cam.position.position
	
	--Move Cam towards Player
	Dist = AcornObject.position:getDistanceTo(Cam.position)
	if Dist > 17 then	
		Cam.position:moveTowards(AcornObject.position, 0.15, {true, false, true})
	end
	
	for a = 1, #Trees, 1 do
		Trees[a]:update()
		Trees[a].model:blit()
	end
	
	CAngle = Cam.position.rotation
	CAngle[1] = CAngle[1]
	
	if controls.left() then
		AcornObject.position:setPosition(AcornObject.position.position[1] + math.cos(CAngle[1] + rad(270)) / 5, AcornObject.position.position[2], AcornObject.position.position[3] + math.sin(CAngle[1] + rad(270)) / 5)
	end
	if controls.right() then
		AcornObject.position:setPosition(AcornObject.position.position[1] + math.cos(CAngle[1] + rad(90)) / 5, AcornObject.position.position[2], AcornObject.position.position[3] + math.sin(CAngle[1] + rad(90)) / 5)
	end
	if controls.up() then
		AcornObject.position:setPosition(AcornObject.position.position[1] + math.cos(CAngle[1]) / 5, AcornObject.position.position[2], AcornObject.position.position[3] + math.sin(CAngle[1]) / 5)
	end
	if controls.down() then
		AcornObject.position:setPosition(AcornObject.position.position[1] + math.cos(CAngle[1] + rad(180)) / 5, AcornObject.position.position[2], AcornObject.position.position[3] + math.sin(CAngle[1] + rad(180)) / 5)
	end
	if controls.l() then
		Cam.position:setPosition(Cam.position.position[1] + math.cos(CAngle[1] + rad (270)) / 5, Cam.position.position[2], Cam.position.position[3] + math.sin(CAngle[1] + rad(270)) / 5)
	end
	if controls.r() then
		Cam.position:setPosition(Cam.position.position[1] + math.cos(CAngle[1] + rad (90)) / 5, Cam.position.position[2], Cam.position.position[3] + math.sin(CAngle[1] + rad(90)) / 5)
		
	end
	
	screen.print(0, 2, "Distance to Player: " .. Dist, color.new(255, 255, 255))
	screen.print(0, 16, "Player: (" .. APos[1] .. ", " .. APos[2] .. ", " .. APos[3] .. ")", color.new(255, 255, 255))
	screen.print(0, 32, "Camera: (" .. BPos[1] .. ", " .. BPos[2] .. ", " .. BPos[3] .. ")", color.new(255, 255, 255))
	screen.print(0, 48, "Angle to player: " .. math.deg(CAngle[1]), color.new(255, 255, 255))
	
	screen.flip()
	screen.waitvblank()
end