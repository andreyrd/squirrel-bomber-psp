-- We'll just have credits roll, exitable by cross, speed up by up/down Dpad

about = Credits.create()
about:setDirection(-1)

about:addItem("2D Graphics Design")
about:addItem("frankdrey")
about:addItem("")
about:addItem("3D Graphics Design")
about:addItem("Skyl3r and frankdrey")
about:addItem("")
about:addItem("Engine")
about:addItem("Skyl3r and frankdrey")
about:addItem("")
about:addItem("Game Design")
about:addItem("frankdrey and Skyl3r")
about:addItem("")
about:addItem("Game")
about:addItem("frankdrey and Skyl3r")
about:addItem("")
about:addItem("Credit Revision")
about:addItem("Skyl3r ^_^")
about:addItem("")
about:addItem("Please Visit http://bb.waratteka.net/")
about:addItem("For regular updates and suggestions!")
about:addItem("")
about:addItem("")
about:addItem("Thanks for Playing!")

while true do
	controls.read()
	
	about:setScrollSpeed(1)

	about:drawFrame()
	
	screen.flip()
	screen.waitvblankstart()
	
	if controls.up() then
		about:setScrollSpeed(2)
	end
	if controls.down() then
		about:setScrollSpeed(0.5)
	end
	if controls.press("cross") then
		break
	end
	
	if about:doneScrolling() == true then
		break
	end
	
	about:scrollFrame()
end
	