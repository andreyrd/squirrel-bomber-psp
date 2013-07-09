cam = Camera.create()
cam.position:setPosition(5, 5, 5)

squirrel = SquirrelAnim.create()
squirrel.position:setPosition(0, 0, 0)
squirrel.position:setRotation(0, 0, 0)

Atmosphere = Environment.create()
Atmosphere:setLights(true) --Enables lights
Atmosphere:setAmbient(color.new(255, 255, 255)) --Sets the ambient color
Atmosphere:setSpecular(4.04) --sets the specular strength
Atmosphere:setFogNear(10) --Sets where fog starts
Atmosphere:setFogFar(30) --And where it ends
Atmosphere:setFogColor(color.new(0, 0, 61)) --And the color of fog ?? WHITE?
Atmosphere:update()

light = Light.create()
light:setId(1)
light:enable()
light:setType(2)
light:setDiffuse(color.new(0,0,0))
light:setAmbient(color.new(255,255,255))
light.position:setPosition(0,10,0)
light:update()

while true do
	controls.read()
	
	world.update()
	
	cam:setView()
	cam.position:rotateTowards(squirrel.position)
	cam:lookAtPosition(squirrel.position)
	
	if controls.cross() then
		squirrel:moveFrame()
	else
		squirrel:reset()
	end
	
	squirrel:drawFrame()
	
	screen.print(0, 2, "FPS: " .. screen.fps(), color.new(255, 255, 255))
	
	if controls.select() then
		error("USB Mode")
	end
	
	CAngle = cam.position.rotation
	if controls.l() then
		cam.position:setPosition(cam.position.position[1] + math.cos(CAngle[1] + math.rad (270)) / 5, cam.position.position[2], cam.position.position[3] + math.sin(CAngle[1] + math.rad(270)) / 5)
	end
	if controls.r() then
		cam.position:setPosition(cam.position.position[1] + math.cos(CAngle[1] + math.rad (90)) / 5, cam.position.position[2], cam.position.position[3] + math.sin(CAngle[1] + math.rad(90)) / 5)
	end
	
	if controls.left() then
		squirrel.position:setRotation(squirrel.position.rotation[1], squirrel.position.rotation[2] - 0.05, squirrel.position.rotation[3])
	end
	if controls.right() then
		squirrel.position:setRotation(squirrel.position.rotation[1], squirrel.position.rotation[2] + 0.05, squirrel.position.rotation[3])
	end
	
	screen.flip()
	screen.waitvblank()
end