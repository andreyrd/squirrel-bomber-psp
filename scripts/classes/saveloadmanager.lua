SaveLoadManager = {}
SaveLoadManager.__index = SaveLoadManager

function SaveLoadManager.create()
	local slm = {}
	setmetatable(slm, SaveLoadManager)

	slm.gameid = SQRL_001
	
	slm.curdest = {}
	slm.curconfig = {}
	slm.curdata = nil
	
	return slm
end

function SaveLoadManager:saveDialog(savedata)
	savetable = savedata:saveOut()
	self.curdest = savetable[1]
	self.curconfig = savetable[2]
	self.curdata = savetable[3]
	
	savedata:save(self.curdest, self.curconfig, self.curdata)
end

function SaveLoadManager:loadDialog()
	a,b,c = savedata.load({self.gameid,nil})
	
	return {b,c}
end