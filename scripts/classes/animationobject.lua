AnimationObject = {}
AnimationObject.__index = AnimationObject

function AnimationObject.create()
	local obj = {}
	setmetatable(obj, AnimationObject)
	
	obj.Object = nil
	
	
	obj.currentFrame = 1
	obj.NextFrame = 0
	obj.Smoothing = 3 --Three steps in between each movement
	obj.smoothStep = 1
	
	obj.TranslationSteps = {}
	obj.RotationSteps = {}
	
	obj.DeltaTranslation = {0, 0, 0}
	obj.DeltaRotation = {0, 0, 0}
	
	obj.AnimationVector = Vector.create({0, 0, 0}, {0, 0, 0})
	
	obj.Pos = {0, 0, 0}
	obj.Rot = {0, 0, 0}
	return obj
end


function AnimationObject:setObject(obj)
	self.Object = obj
end

function AnimationObject:setStep(st)
	self.CurrentStep = 1
end

function AnimationObject:setSpeed(sp)
	self.Speed = sp
end

function AnimationObject:setSmoothing(sm)
	self.Smoothing = sm
end

function AnimationObject:addTranslationStep(Number3)
	table.insert(self.TranslationSteps, Number3)
end

function AnimationObject:addRotationStep(Number3)
	table.insert(self.RotationSteps, Number3)
end

function AnimationObject:play()
	--First step is to make sure we have multiple frames.
	if #self.TranslationSteps > 1 and #self.RotationSteps > 1 then
		self.NextFrame = self.currentFrame + 1
		if self.NextFrame > #self.TranslationSteps then
			self.NextFrame = 1
		end
		--Check if we are moving to the next step:
		if self.smoothStep <= self.Smoothing then
			--If it's the first part, then let's get all the deltas:
			if self.smoothStep == 1 then
				--Now we find the delta distance between the current frame and the next one.
				self.DeltaTranslation[1] = (self.TranslationSteps[self.NextFrame][1] - self.AnimationVector.position[1]) / self.Smoothing
				self.DeltaTranslation[2] = (self.TranslationSteps[self.NextFrame][2] - self.AnimationVector.position[2]) / self.Smoothing
				self.DeltaTranslation[3] = (self.TranslationSteps[self.NextFrame][3] - self.AnimationVector.position[3]) / self.Smoothing
				
				self.DeltaRotation[1] = (self.TranslationSteps[self.NextFrame][1] - self.AnimationVector.rotation[1]) / self.Smoothing
				self.DeltaRotation[2] = (self.TranslationSteps[self.NextFrame][2] - self.AnimationVector.rotation[2]) / self.Smoothing
				self.DeltaRotation[3] = (self.TranslationSteps[self.NextFrame][3] - self.AnimationVector.rotation[3]) / self.Smoothing
				
				--and finally, we can apply them:
				self.AnimationVector:addToPosition(self.DeltaTranslation[1], self.DeltaTranslation[2], self.DeltaTranslation[3])
				self.AnimationVector:addToRotation(self.DeltaRotation[1], self.DeltaRotation[2], self.DeltaRotation[3])
			
			--If it's not the first smoothing step, go ahead and add the Deltas we should have already found.
			else
				self.AnimationVector:addToPosition(self.DeltaTranslation[1], self.DeltaTranslation[2], self.DeltaTranslation[3])
				self.AnimationVector:addToRotation(self.DeltaRotation[1], self.DeltaRotation[2], self.DeltaRotation[3])
			end
			
		--If this wasn't true, then that means we are done smoothing this frame and we should move on to the next one.
		else
			self.smoothStep = 1
			self.currentFrame = self.currentFrame + 1
			--Make sure it maxs at how ever many frames we have:
			if self.currentFrame > #self.TranslationSteps then
				self.currentFrame = 1
			end
		end
	end
end

function AnimationObject:draw()
	--The first thing is to make sure we are drawing the object at it's ACTUAL position instead of it's animation relative position:
	
	--Checking which of these pieces of SHIT is returning nil -_-
	self.Pos[1] = self.AnimationVector.position[1] + self.Object.position.position[1]
	self.Pos[2] = self.AnimationVector.position[2] + self.Object.position.position[2]
	self.Pos[3] = self.AnimationVector.position[3] + self.Object.position.position[3]
	
	
	self.Rot[1] = self.AnimationVector.rotation[1] + self.Object.position.rotation[1]
	self.Rot[2] = self.AnimationVector.rotation[2] + self.Object.position.rotation[2]
	self.Rot[3] = self.AnimationVector.rotation[3] + self.Object.position.rotation[3]
	
	--We'll update the model before overriding for the LULZ (Just in case :P )
	self.Object:update()
	
	self.Object.model:position(self.Pos[1], self.Pos[2], self.Pos[3])
	self.Object.model:rotation(self.Rot[1], self.Rot[2], self.Rot[3])
	
	self.Object.model:blit()
end