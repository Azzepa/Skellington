
local settings = {

-- THIS IS THE ONLY PLACE YOU NEED TO CHANGE VALUES

	fullscreen = true;
	windowHeight = 480;
	windowWidth = 640;

	-- IF YOUR COMPUTER HAS A SLOW GPU CHANGE THIS TO FALSE
	hardwareRendered = true;

	-- DO NOT CHANGE ANYTHING AFTER THIS LINE

}

-- FUNCTION FOR TESTING PURPOSES ONLY
function PrintAllValues()
	print("Fullscreen: ", settings["fullscreen"])
	print("Window Height: ", settings["windowHeight"])
	print("Window Width: ", settings["windowWidth"])
	print("HardwareRendered: ", settings["hardwareRendered"])
end

function GetSetting(setting)
	return settings[setting]
end

function RunMethod(func)
	if (func == "PrintAllValues") then
		PrintAllValues()
	end
end

function GetValueFrom(func)
	if (func == "WindowHeight") then
		return GetWindowHeight()
	elseif (func == "WindowWidth") then
		return GetWindowWidth()
	elseif (func == "HardwareRendered") then
		return IsHardwareRendered()
	elseif (func == "IsFullscreen") then
		return IsFullscreen()
	else
		return nil
	end
end
