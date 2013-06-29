optionsmenu = Menu.create()
optionsmenu:addItem('Graphics', 'scripts/options_graphics.lua')
optionsmenu:addItem('Sound', 'scripts/options_sound.lua')
optionsmenu:addItem('Controls', 'scripts/options_controls.lua')
optionsmenu:addItem('Go back...', 'scripts/mainmenu.lua')

while true do
	controls.read()
	
	if controls.press("up") then
		optionsmenu:moveUp()
	end
	if controls.press("down") then
		optionsmenu:moveDown()
	end
	if controls.press("cross") then
		optionsmenu:executeSelected()
	end
	
	optionsmenu:drawFrame()
	screen.flip()
	screen.waitvblankstart()
end