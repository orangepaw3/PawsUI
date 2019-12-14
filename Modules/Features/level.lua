LevelUpDisplay:UnregisterEvent("PLAYER_LEVEL_UP") -- Disables Normal Level-Up Grats

local function Grats(level) -- Defines settings for "Grats-ing"
	ZoneTextString:SetText("Congratulations, " .. UnitName("player") .. "!!");
	ZoneTextString:SetTextColor(1, 1, 0);
	SubZoneTextString:SetText("You just reached level " .. level );
	SubZoneTextString:SetTextColor(0, 1, 0);
	ZoneTextFrame.startTime=GetTime();
	SubZoneTextFrame.startTime=GetTime();
	ZoneTextFrame:Show();
	SubZoneTextFrame:Show();
end

local frame = CreateFrame("Frame") -- Creates the Frame for the level up Grats

frame:SetScript("OnEvent", function(this, event, ...)

	Grats(UnitLevel("player") + 1)

end)

frame:RegisterEvent("PLAYER_LEVEL_UP") -- Triggers the level-up

-- Slash command for testing

SLASH_LEVELUPGRATS1 = "/levelupgrats"
SLASH_LEVELUPGRATS2 = "/lug"
SlashCmdList["LEVELUPGRATS"] = Grats
