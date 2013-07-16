cam = Camera.create()
cam.position:setPosition(0, 10, 0)

TreeModel = model.load("objects/treebase.obj", 0.15, color.new(0, 0, 0))
TreeMap = {{-30,0,0},{30,0,0},{0,0,30}}
Trees = {}

for a = 1, #TreeMap, 1 do
	table.insert(Trees, Object.create(TreeModel))
	Trees[a].position:setPosition(TreeMap[a][1], TreeMap[a][2], TreeMap[a][3])
	Trees[a].collider:setType(2) -- Cylinder
	Trees[a].collider:setData({{-(9)/2, 0, -(9)/2}, {9, 15, 9}})
	Trees[a].collider:setRadius(5.8)
	Trees[a]:update()
end

Floor = Object.create(model.load("objects/forestfloor.obj"))
Floor.position:setPosition(2, 0, 0)
Floor:update()

Atmosphere = Environment.create()
Atmosphere:setLights(true) --Enables lights
Atmosphere:setAmbient(color.new(255, 255, 255)) --Sets the ambient color
Atmosphere:setSpecular(4.04) --sets the specular strength
Atmosphere:setFogNear(10) --Sets where fog starts
Atmosphere:setFogFar(30) --And where it ends
Atmosphere:setFogColor(color.new(0, 0, 61))
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
	
	Floor:update()
	Floor.model:blit()
	
	for a = 1, #Trees, 1 do
		Trees[a]:update()
		Trees[a].model:blit()
	end
	
	if controls.right() then
		cam.position:setRotation(cam.position.rotation[1],
								 cam.position.rotation[2] + 0.05,
								 cam.position.rotation[3])
	end
	
	if controls.left() then
		cam.position:setRotation(cam.position.rotation[1],
								 cam.position.rotation[2] - 0.05,
								 cam.position.rotation[3])
	end
	
	if controls.up() then
		cam.position:setRotation(cam.position.rotation[1] + 0.05,
								 cam.position.rotation[2],
								 cam.position.rotation[3])
	end
	
	if controls.down() then
		cam.position:setRotation(cam.position.rotation[1] - 0.05,
								 cam.position.rotation[2],
								 cam.position.rotation[3])
	end
	
	if controls.l() then
		cam.position:setRotation(cam.position.rotation[1],
								 cam.position.rotation[2],
								 cam.position.rotation[3] - 0.05)
	end
	
	if controls.r() then
		cam.position:setRotation(cam.position.rotation[1],
								 cam.position.rotation[2],
								 cam.position.rotation[3] + 0.05)
	end
	
	if controls.select() then
		error("USB Mode")
	end
	
	screen.flip()
	screen.waitvblank()
end