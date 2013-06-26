dofile('scripts/load.lua')

--Haven't tested this yet.

--Test out my classes too:
Cam = Camera.create()
Cam.position:setPosition(0, 0, -5)
Cam:update()

AcornPosition = Vector.create({0, 0, 0}, {0, 0, 0})
AcornCollider = CollisionData.create({{-2, 0, -2}, {4, 4, 4}})
AcornObject = Object.create(model.load("objects/acorn.obj", 0.1, color.new(0, 0, 0)), AcornPosition, AcornCollider)
AcornObject:update()


while true do
	AcornObject.model:blit()
	
	screen.flip()
	screen.waitvblankstart()
end