mainmenu = Menu.create()
mainmenu:addItem('Launch Game', 'scripts/startup.lua')
mainmenu:addItem('About', 'scripts/about.lua')
mainmenu:addItem('Options', 'scripts/options.lua')
mainmenu:addItem('Exit', 'scripts/exit.lua')
mainmenu:addItem('FPSController Test', 'scripts/fpstest.lua')
mainmenu:addItem('forest1', 'scripts/world_forest1.lua')
mainmenu:addItem('Nest', 'scripts/world_nest.lua')
mainmenu:addItem('SquirAnim', 'scripts/squirrelanimtest.lua')
mainmenu:addItem('SquirAnim2', 'scripts/squirrelanimtest2.lua')
mainmenu:addItem('About', 'scripts/about.lua')
mainmenu:addItem('savetest', 'scripts/savetest.lua')
mainmenu:addItem('Reset', 'scripts/reset.lua')
mainmenu:addItem('Camera Test', 'scripts/camtest.lua')

while true do
	controls.read()
	
	if controls.press("up") then
		mainmenu:moveUp()
	end
	if controls.press("down") then
		mainmenu:moveDown()
	end
	if controls.press("cross") then
		mainmenu:executeSelected()
	end
	
	mainmenu:drawFrame()
	screen.flip()
	screen.waitvblankstart()
end