-- We'll just have credits roll, exitable by cross, speed up by up/down Dpad

about = Credits.create()
about:setDirection(-1)

about:addItem("Created by:")
about:addItem("Skyl3r/TenCashMan/10$man")
about:addItem("frankdrey/frank/NerdyGuitarist")
about:addItem("")
about:addItem("Stuff :P")
about:addItem("More stuff...")
about:addItem("Stuff :P")
about:addItem("More stuff...")
about:addItem("Stuff :P")
about:addItem("More stuff...")
about:addItem("Stuff :P")
about:addItem("More stuff...")
about:addItem("Stuff :P")
about:addItem("More stuff...")
about:addItem("lol just testing")

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
	