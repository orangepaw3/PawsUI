-- Configuration
local camSpeed = 0.1  -- The speed of the rotation, higher is faster
local returnView = true; -- This makes the camera return to its original position when you return from AFK.

-- Global Variables (a Global Variable is something that can be used across the whole addon)
local isAFK = false; -- When this is default false the player is active, we use the trigger to switch it on.
local smoothCamera; -- Creates the Variable "smoothCamera."

-- Functions (the things the addon does)
local function beginMovement (speed)
	smoothCamera = GetCVar("cameraSmoothStyle"); -- the CVar "cameraSmoothStyle" determines the style of the camera.
	if (returnView) then -- An if statement is like a true and false, a yes or no.
		SaveView(5); -- There are 5 "slots" to "save" or "load" camera positions.  We are using "5" of 5.
	end -- If statements must end on the same "line" they start per beginning. Example here. They line up vertically. That is a "Block."
	MoveViewLeftStart(speed);
	UIParent:Hide()
end -- This "end" ends the function "beginMovement." Think of this concept as a box of code, within a box. Containers.

local function endMovement () -- There is nothing in the "()" because we are stopping speed and movement.
	MoveViewLeftStop();
	if (returnView) then
		SetView(5); -- There are 5 view "slots."
	end
	UIParent:Show()
	SetCVar("cameraSmoothStyle", smoothCamera);
end

-- Now that we can start the movement, and stop the movement, we can set up the "trigger." In this case the function.
local function onStatusChange (self, event, ...)
	if (UnitIsAFK("player") and not isAFK) then -- This tells the addon the Player is AFK.
		if (C_PetBattles.IsInBattle()==false) then -- This tells the addon the player is not in a Pet Battle.
			beginMovement(camSpeed); -- This tells the addon to start moving the cam at the specified speed due to AFK.
		end
		isAFK = true; -- This sets the status of the addon to "true." The "switch is on as mentioned above."
	elseif (not UnitIsAFK("player") and isAFK) then -- This is saying the player is NOT AFK.
		endMovement();
		isAFK = false; -- This sets the status of the addon to "false." The "switch" is off.
	end
end

local function main () -- This is the main function which creates the frame. It has no variables.
	local frame = CreateFrame("FRAME", "AfkCamFrame"); -- The Frame.
	frame:RegisterEvent("PLAYER_FLAGS_CHANGED"); -- The "PLAYER_FLAGS_CHANGED" - is something that happens in WoW when you un-AFK. We are registering this event to this frame.
	frame:SetScript("OnEvent", onStatusChange);  -- Sets the script to the frame in this variable, function.
end

main(); -- calls the main function to work.

	-- end of file