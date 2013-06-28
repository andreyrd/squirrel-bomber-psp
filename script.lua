dofile('scripts/load.lua')

mainmenu = Menu.create(1)
mainmenu:addItem('Test', 'scripts/test.lua')
mainmenu:addItem('Scores', 'scripts/scores.lua')
mainmenu:addItem('Options', 'scripts/options.lua')
mainmenu:addItem('Exit', 'scripts/exit.lua')
mainmenu:centerMenu()
mainmenu:setPositionY(20)

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