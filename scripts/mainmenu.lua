mainmenu = Menu.create()
mainmenu:addItem('Test', 'scripts/test.lua')
mainmenu:addItem('Scores', 'scripts/scores.lua')
mainmenu:addItem('Options', 'scripts/options.lua')
mainmenu:addItem('Exit', 'scripts/exit.lua')
mainmenu:addItem('Test2', 'scripts/test2.lua')
mainmenu:addItem('Test3', 'scripts/test3.lua')
mainmenu:addItem('Test4', 'scripts/test3.lua')
mainmenu:addItem('Test5', 'scripts/test3.lua')

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