cam = Camera.create()
cam.position:setPosition(5, 5, 5)

--First, create animation Objects and testtyy:
BackLegsObj = Object.create(model.load("objects/squirrel_backlegs.obj", 0.1, color.new(0,0,0)))
BackLegs = AnimationObject.create()

BackLegs:setObject(BackLegsObj) --Link them together

--The Animation
BackLegs:addTranslationStep({0.5, 0.2, 0.1}) --Move it a small amount
BackLegs:addRotationStep({50, 30, 10}) --Rotate a little too.

BackLegs:addTranslationStep({0, 0, 0}) --0, 0, 0 Is the objects local origin
BackLegs:addRotationStep({0, 0, 0}) --0, 0, 0 Is no rotations on the local origin

BackLegs:addTranslationStep({-0.4, -0.2, -0.1}) --Move it a small amount
BackLegs:addRotationStep({50, 30, 10}) --Rotate a little too.


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
	cam.position:rotateTowards(BackLegsObj.position)
	cam:lookAtPosition(BackLegsObj.position)
	
	if controls.cross() then
		BackLegs:play()
	end
	
	BackLegs:draw()
	
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
		BackLegsObj:setRotation(BackLegsObj.position.rotation[1], BackLegsObj.position.rotation[2] - 0.05, BackLegsObj.position.rotation[3])
	end
	if controls.right() then
		BackLegsObj:setRotation(BackLegsObj.position.rotation[1], BackLegsObj.position.rotation[2] + 0.05, BackLegsObj.position.rotation[3])
	end
	
	screen.print(0, 16, "Vector Position: " .. BackLegs.Pos[1] .. ", " .. BackLegs.Pos[2] .. ", " .. BackLegs.Pos[3], color.new(255, 255, 255))
	screen.print(0, 48, "Delta Steps: " .. BackLegs.DeltaTranslation[1] .. ", " .. BackLegs.DeltaTranslation[2] .. ", " .. BackLegs.DeltaTranslation[3], color.new(255, 255, 255))
	screen.flip()
	screen.waitvblank()
end