--Because, I like life to be easier on me :)

--AnimationManager:
AnimationManager.create()
AnimationManager:addAnimation(Object, id) --Object = AnimationObject
AnimationManager:play(id)
AnimationManager:blit(id)

--AnimationObject:
AnimationObject.create()
AnimationObject:setSpeed(speed)
AnimationObject:addModel(model)
AnimationObject:reset()
AnimationObject:play()
AnimationObject:position(x, y, z)
AnimationObject:rotation(x, y, z)
AnimationObject:blit()

--Vectors:
Vector.create()
Vector:setPosition(x, y, z)
Vector:setRotation(x, y, z)
Vector:rotateTowards(vector)

--Colliders
CollisionData.create()
CollisionData:setData(data)
CollisionData:checkCollision(CollisionData)
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
Camera:lookAtPosition(vector)
Camera:lookAtRotation() --Uses it's own vector for rotation!
Camera.position - Vector

--Light:
Light.create(id or 1)
Light:update()
Light:setId(id)
Light:enable()
Light:disable()
Light:setType(type)
Light:setDiffuse(Color)
Light:setAmbient(Color)
Light.position - Vector

--Camera Manager:
CameraManager.create()
CameraManager:setActiveCamera(n)
CameraManager:addCamera(Camera)
CameraManager:setView()

--Light Manager:
LightManager.create()
LightManager:addLight(Light)
LightManager:removeLight(id or last)


--Environment:
Environment.create()
Environment:setLights(status)
Environment:setAmbient(color)
Environment:setSpecular(Str)
Environment:setFogNear(n)
Environment:setFogFar(n)
Environment:setFogColor(color)
Environment:update()

--Menu:
Menu.create(id) --Why ID?
Menu:addItem(title, script)
Menu:removeItem(id)
Menu:drawFrame()
Menu:moveUp()
Menu:moveDown()
Menu:executeSelected()
Menu:setPosition(x, y)
Menu:setSelectedColor(color)
Menu:setUnselectedColor(color)