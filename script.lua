dofile('scripts/load.lua')

--Haven't tested this yet.

--Test out my classes too:
Cam = Camera.create()
Cam.position:setPosition(0, 10, 0)

AcornObject = Object.create(model.load("objects/acorn.obj", 0.3, color.new(0, 0, 0)))
AcornObject.collider:setData({{-(2.255)/2, 0, -(2.255)/2}, {2.255, 2.255, 2.255}})
AcornObject.position:setPosition(0, 0, 0)
AcornObject:update()

OtherAcorn = Object.create(AcornObject.model)
OtherAcorn.position:setPosition(-5, 0, 0)
OtherAcorn.collider:setData({{-(2.255)/2, 0, -(2.255)/2}, {2.255, 2.255, 2.255}})
OtherAcorn:update() 

--Some floor:
Floor = Object.create(model.load("objects/forestfloor.obj"))
Floor.position:setPosition(0, 0, 0)
Floor:update()

--NOTE:
--These settings are all default. We could just do:
--[[
Atmosphere = Environment.create()
Atmosphere:update()
]]--

--To get the same results.
--I did this to show the functions and their usage.
Atmosphere = Environment.create()
Atmosphere:setLights(true) --Enables lights
Atmosphere:setAmbient(color.new(255, 255, 255)) --Sets the ambient color
Atmosphere:setSpecular(4.04) --sets the specular strength
Atmosphere:setFogNear(8) --Sets where fog starts
Atmosphere:setFogFar(25) --And where it ends
Atmosphere:setFogColor(color.new(0, 0, 0)) --And the color of fog
Atmosphere:update() --Finally, apply it to the world.

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
	
	Floor:update()
	Floor.model:blit()
	
	AcornObject:update()
	AcornObject.model:blit()
	
	OtherAcorn:update()
	OtherAcorn.model:blit()
	
	--Time to test out the rotate towards function:
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
	
	--Might as well test out collisions while we have two acorns on the screen:
	
	
	screen.print(0, 5, "Cam's Position: (" .. Cam.position.position[1] .. ", " .. Cam.position.position[2] .. ", " .. Cam.position.position[3] .. ")", color.new(255, 255, 255))
	screen.print(0, 20, "Cam's Looking At: (" .. Cam.lookAt[1] .. ", " .. Cam.lookAt[2] .. ", " .. Cam.lookAt[3] .. ")", color.new(255, 255, 255))
	
	if AcornObject.collider:checkCollision(OtherAcorn.collider) then
		screen.print(0, 34, "Collision!", color.new(255, 255, 255))
	else
		screen.print(0, 34, "No collision... :(", color.new(255, 255, 255))
	end
	
	screen.flip()
	screen.waitvblankstart()
end