cam = Camera.create()
cam.position:setPosition(5, 5, 5)

function qm(msg)
	screen.print(0, 5, msg, color.new(255, 255, 255))
	screen.flip()
	screen.waitvblankstart()
end


qm("Preparing to Load Squirrel Models")
--The animation object acts as a model:
Squirrel = AnimationObject.create()
--Add the animation
qm("Loading Model 1")
Squirrel:addModel(model.load("objects/swt.obj", 0.1, color.new(0, 0, 0)))
qm("Loading Model 2")
Squirrel:addModel(model.load("objects/swn.obj", 0.1, color.new(0, 0, 0)))
qm("Loading Model 3")
Squirrel:addModel(model.load("objects/swm.obj", 0.1, color.new(0, 0, 0)))
qm("Loading Model 4")
Squirrel:addModel(model.load("objects/swr.obj", 0.1, color.new(0, 0, 0)))
qm("Loading Model 5")
Squirrel:addModel(model.load("objects/swl.obj", 0.1, color.new(0, 0, 0)))
qm("Loading Model 6")
Squirrel:addModel(model.load("objects/swj.obj", 0.1, color.new(0, 0, 0)))

Squirrel:setSpeed(4)

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
	cam.position:rotateTowards(Squirrel.position)
	cam:lookAtPosition(Squirrel.position)
	
	if controls.cross() then
		Squirrel:play()
	else
		Squirrel:reset()
	end
	
	Squirrel:blit()
	
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
		Squirrel.position:setRotation(Squirrel.position.rotation[1], Squirrel.position.rotation[2] - 0.05, Squirrel.position.rotation[3])
	end
	if controls.right() then
		Squirrel.position:setRotation(Squirrel.position.rotation[1], Squirrel.position.rotation[2] + 0.05, Squirrel.position.rotation[3])
	end
	
	screen.print(0, 4, "Free Memory: " .. os.getfreememory()/1024/1024, color.new(255, 255, 255)) --Bytes to KB to MB
	
	screen.flip()
	screen.waitvblank()
end