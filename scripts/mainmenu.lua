mainmenu = Menu.create()
mainmenu:addItem('Test', 'scripts/test.lua')
mainmenu:addItem('About', 'scripts/about.lua')
mainmenu:addItem('Options', 'scripts/options.lua')
mainmenu:addItem('Exit', 'scripts/exit.lua')
mainmenu:addItem('FPSController Test', 'scripts/fpstest.lua')
mainmenu:addItem('forest1', 'scripts/world_forest1.lua')
mainmenu:addItem('Test4', 'scripts/test3.lua')
mainmenu:addItem('Test5', 'scripts/test3.lua')
mainmenu:addItem('About', 'scripts/about.lua')
mainmenu:addItem('Tst', 'scripts/about.lua')
mainmenu:addItem('Reset', 'scripts/reset.lua')

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