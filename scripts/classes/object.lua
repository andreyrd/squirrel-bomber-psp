--Requires:
--vector.lua
--collisiondata.lua

--Create our Generic Object class
Object = {}
Object.__index = Object

function Object.create(Model)
	local obj = {}
	setmetatable(obj, Object)
	obj.model = Object
	obj.position = Vector.create({0, 0, 0}, {0, 0, 0})
	obj.collider = CollisionData.create()
	
	return obj
end

function Object:setModel(Model)
	self.model = Model
end

function Object:update()
	self.model:position(self.position.position[1], self.position.position[2], self.position.position[3])
	self.model:rotation(self.position.rotation[1], self.position.rotation[2], self.position.rotation[3])
	
	self.collider.position:setPosition(self.position.position[1], self.position.position[2], self.position.position[3])
end

function Object:clearModel()
	self.model:free()
	self.model = nil
	
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