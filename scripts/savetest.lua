saveman = SaveLoadManager.create()

save = GameSave.create()

save:setName()

save.details = "Testing2"

saveman:saveDialog(save)

save.details = "Testing"

screen.print(0,0,save.details,color.new(255,255,255))
screen.flip()
screen.waitvblank()

for a = 1, 200, 1 do
	--crap
end

save:saveIn(saveman:loadDialog())

screen.print(0,0,save.details,color.new(255,255,255))
screen.flip()
screen.waitvblank()