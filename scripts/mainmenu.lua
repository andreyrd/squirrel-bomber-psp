mainmenu = Menu.create()
mainmenu:addItem('Launch Game', 'scripts/startup.lua')
mainmenu:addItem('About', 'scripts/about.lua')
mainmenu:addItem('Options', 'scripts/options.lua')
mainmenu:addItem('Exit', 'scripts/exit.lua')
mainmenu:addItem('forest1', 'scripts/world_forest1.lua')
mainmenu:addItem('Nest', 'scripts/world_nest.lua')

while true do
	controls.read()
	
	if controls.press("up") then
		mainmenu:moveUp()
	elseif controls.press("down") then
		mainmenu:moveDown()
	elseif controls.press("cross") then
		mainmenu:executeSelected()
	elseif controls.press("l") then
		mainmenu:pagePrev()
	elseif controls.press("r") then
		mainmenu:pageNext()
	end
	
	mainmenu:drawFrame()
	screen.flip()
	screen.waitvblankstart()
end