Keys = {}
Keys.__index = Keys

function Keys.create()
	local keys = {}
	setmetatable(keys, Keys)
	keys.up = controls.up
	keys.down = controls.down
	keys.left = controls.left
	keys.right = controls.right
	keys.l = controls.l
	keys.r = controls.r
	keys.analogx = controls.analogx
	keys.analogy = controls.analogy
	
	return keys
end

