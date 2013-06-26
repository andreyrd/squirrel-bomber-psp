dofile('scripts/load.lua')

--Haven't tested this yet.

--Test out my classes too:
Cam = Camera.create()
Cam.position:setPosition(0, 1, 4)

--Should 
AcornObject = Object.create(model.load("objects/acorn.obj", 0.1, color.new(0, 255, 0)), AcornPosition, AcornCollider)
AcornObject.collider:setData({{-(2.255)/2, 0, -(2.255)/2}, {2.255, 2.255, 2.255}})
AcornObject.position:setPosition(0, 0, 0)
AcornObject:update()

--TEMPORARY LIGHTING STUFF
--World functions
world.lightenabled(1, true)
world.lighttype(1, 2)
world.lightcomponent(1, 1)
world.lightambient(1, color.new(255, 255, 255))
world.lightposition(1, 0, 2, 0)
world.lightattenuation(1, 0, 0, 0.0000005)
world.lights(true)
world.ambient(color.new(0, 0, 0))
world.lightdiffuse(1, color.new(0, 0, 0))
world.specular(3)
world.fog(8, 10, color.new(0, 0, 0))
world.update()

Cam:update()

while true do
	controls.read()
	Cam:setView()
	
	AcornObject.model:blit()
	
	if controls.up() then
		Cam.position:setPosition(0, Cam.position.position[2] + 0.1, 4) --Raises the camera
		Cam:update()
	end
	
	if controls.down() then
		Cam.position:setPosition(0, Cam.position.position[2] - 0.1, 4) --Lowers the camera
		Cam:update()
	end
	if controls.right() then
		Cam.position:setRotation(Cam.position.rotation[1] + 6, 0, 0) --Rotates right
		Cam:update()
	end
	if controls.left() then
		Cam.position:setRotation(Cam.position.rotation[1] - 6, 0, 0) --Rotates left
		Cam:update()
	end
	screen.print(0, 5, "Cam's Position: (" .. Cam.position.position[1] .. ", " .. Cam.position.position[2] .. ", " .. Cam.position.position[3] .. ")", color.new(255, 255, 255))
	screen.print(0, 20, "Cam's Looking At: (" .. Cam.lookAt[1] .. ", " .. Cam.lookAt[2] .. ", " .. Cam.lookAt[3] .. ")", color.new(255, 255, 255))
	
	screen.flip()
	screen.waitvblankstart()
end