--Requires:
--vector.lua
--collisiondata.lua

--Create our Generic Object class
Object = {}
Object.__index = Object

function Object.create(Model, Vector3, Collider)
	local obj = {}
	setmetatable(obj, Object)
	obj.model = Object
	obj.position = Vector3
	obj.collider = Collider
	
	return obj
end

function Object:setModel(Model)
	obj.model = Model
end

function Object:update()
	self.model:position(obj.position.position[1], obj.position.position[2], obj.position.position[3])
	self.model:rotation(obj.position.rotation[1], obj.position.rotation[2], obj.position.rotation[3])
end

function Object:clearModel()
	obj.model:free()
	obj.model = nil
	
	collectgarbage()
end


--[[
We can create objects like:

objectCollider = CollisionData.create({MinX, MinY, MinZ}, {Width, Height, Depth})
objectPosition = Vector.create({position_x, position_y, position_z}, {rotation_x, rotation_y, rotation_z})
newObject = Object.create(model.load("object.obj", 0.1, color.new(0, 0, 0)), objectPosition, objectCollision)

We  can use them like:
newObject.position:setPosition(x, y, z)

newObject.position:setRotation(rotX, rotY, rotZ)

We can check for collisions with other objects like this:
newObject.collider:checkCollision(otherObject.collider)

--When we want to blit them we do:
newObject:update()
newObject.model:blit()

So clean... So pretty...

Pretty awesome, no?

OH, and the files need to be loaded in this order:
collisiondata.lua
vector.lua
object.lua
]]--