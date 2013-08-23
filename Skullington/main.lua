
-- THIS IS THE ONLY PLACE YOU NEED TO CHANGE VALUES

-- function SetValues() do
	fullscreen = true
	windowHeight = 480
	windowWidth = 640

	-- IF YOUR COMPUTER HAS A SLOW GPU CHANGE THIS TO FALSE
	hardwareRendered = true
-- end

-- DO NOT CHNAGE ANYTHING AFTER THIS LINE

-- FUNCTION FOR TESTING PURPOSES ONLY
function PrintAllValues()
	print("Fullscreen: ", fullscreen)
	print("Window Height: ", windowHeight)
	print("Window Width: ", windowWidth)
	print("HardwareRendered: ", hardwareRendered)
end

function GetScreenHeight()
	return screenHeight
end

function RunMethod(method)
	if (method == "setValues") then
		SetValues()
	elseif (method == "PrintAllValues") then
		PrintAllValues()
	end
end

function GetValueFrom(method)
	if (method == "WindowHeight") then
		return GetScreenHeight()
	elseif (method == "WindowWidth") then
		return GetScreenWidth()
	elseif (method == "HardwareRendered") then
		return IsHardwareRendered()
	elseif (method == "IsFullscreen") then
		return IsFullscreen()
	else
		return NULL
	end
end
