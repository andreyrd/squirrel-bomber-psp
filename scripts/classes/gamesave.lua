GameSave = {}
GameSave.__index = GameSave

function GameSave.create()
	local save = {}
	setmetatable(save, GameSave)
	
	save.dest = {}
	save.config = {}
	save.data = nil
	
	save.gameid = SQRL_001
	save.savename = nil
	
	save.title = "Squirrel Bomber"
	save.subtitle = "Save data for Squirrel Bomber."
	save.details = nil
	save.savetext = nil
	
	return save
end

function GameSave:setData(data) -- VERY TEMPORARY
	self.data = data
end

function GameSave:setName(name)
	self.savename = name or os.osk("Name", "What's your name?", 48, 1, 0)
	self.savetext = self.savename
	
	self.dest[2] = self.savename
	self.config[4] = self.savetext
end

function GameSave:saveIn(dest, config, data) -- Used by SaveLoadManager
	self.dest = dest
	self.config = config
	self.data = data
	
	self.savename = dest[2]
	
	self.details = config[3]
	self.savetext = config[4]
end

function GameSave:saveOut() -- Used by SaveLoadManager
	dest = self.dest
	config = self.config
	data = self.data
	
	tableout = {dest, config, data}
	
	return tableout
end