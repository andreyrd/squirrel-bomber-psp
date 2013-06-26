dofile('scripts/load.lua')

--Haven't tested this yet.

--Test out my classes too:
Cam = Camera.create()
Cam.position:setPosition(0, 1, -5)

AcornObject = Object.create(model.load("objects/acorn.obj", 0.1, color.new(0, 0, 0)), AcornPosition, AcornCollider)
AcornObject.collider:setData({{-(2.255)/2, 0, -(2.255)/2}, {2.255, 2.255, 2.255}})
AcornObject.position:setPosition(0, 0, 0)
AcornObject:update()

--TEMPORARY LIGHTING STUFF
world.lights(true)
world.ambient(color.new(0, 0, 0))
world.specular(3)
world.fog(8, 10, color.new(0, 0, 0))

--Testing the Light Class:
light = Light.create()
light:setId(1)
light:enable()
light:setType(2)
light:setDiffuse(color.new(0, 0, 0))
light:setAmbient(color.new(255, 255, 255))

light.position:setPosition(0, 0, 0)

light:update()

world.update()


while true do
	controls.read()
	
	Cam:lookAtPosition(AcornObject.position)
	Cam:setView()
	
	AcornObject.model:blit()
	
	--Time to test out the rotate towards function:
	if controls.left() then
		AcornObject.position:setPosition(AcornObject.position.position[1] - 0.1, 0, 0)
	end
	if controls.right() then
		AcornObject.position:setPosition(AcornObject.position.position[1] + 0.1, 0, 0)
	end
	
	AcornObject:update()
	
	screen.print(0, 5, "Cam's Position: (" .. Cam.position.position[1] .. ", " .. Cam.position.position[2] .. ", " .. Cam.position.position[3] .. ")", color.new(255, 255, 255))
	screen.print(0, 20, "Cam's Looking At: (" .. Cam.lookAt[1] .. ", " .. Cam.lookAt[2] .. ", " .. Cam.lookAt[3] .. ")", color.new(255, 255, 255))
	
	screen.flip()
	screen.waitvblankstart()
end