--Because, I like life to be easier on me :)


--Vectors:
Vector.create()
Vector:setPosition(x, y, z)
Vector:setRotation(x, y, z)

--Colliders
CollisionData.create()
CollisionData.checkCollision(CollisionData)
CollisionData.position - Vector

--Objects:
Object.create(model or nil)
Object:setModel(Model)
Object:update()
Object:clearModel()
Object.position - Vector

--Loadscreen:
LoaderScreen.create(percent or nil)
LoaderScreen:setFadeSpeed(Speed)
LoaderScreen:setSplash(image)
LoaderScreen:setPercent(percent)
LoaderScreen:crossFade(newImage)
LoaderScreen:clearSplash()

--Camera:
Camera.create()
Camera:update()
Camera:setView()
Camera.position - Vector

--Light:
Light.create(id or 1)
Light:update()
Light:setId(id)
Light:enabled(status)
Light:setType(type)
Light:setDiffuse(Color)
Light:setAmbient(Color)

--Camera Manager:
CameraManager.create()
CameraManager:setActiveCamera(n)
CameraManager:addCamera(Camera)
CameraManager:setView()

--Light Manager:
LightManager.create()
LightManager:addLight(Light)
LightManager:removeLight(id or last)