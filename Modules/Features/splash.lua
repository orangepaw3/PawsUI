-- We need to add a frame
local splashFrame = CreateFrame("frame",nil,UIParent);
splashFrame:SetFrameStrata("LOW"); -- Sets the Strata
splashFrame:SetWidth(1024); -- Set these to whatever height/width is needed 
splashFrame:SetHeight(512); -- for your Texture
splashFrame:SetPoint("CENTER",0,0);  -- needed to anchor to the screen
splashFrame:SetAlpha(1);

-- Texture

local splashTexture = splashFrame:CreateTexture(nil, "LOW"); -- Sets the texture to Low strata.
splashTexture:SetTexture("Interface\\Addons\\PawsUI\\Art\\splasha.tga"); -- Sets the actual texture.
splashTexture:SetAllPoints(splashFrame); -- Sets all the points to "splashFrame."
splashFrame.texture = splashTexture -- Identifies "splashFrame" texture to the variable name splashTexture.

local eventManager = CreateFrame("Frame");
eventManager:RegisterEvent("PLAYER_ENTERING_WORLD");
eventManager:SetScript("OnEvent", function(self)
	C_Timer.After(3, function()
    	UIFrameFadeOut(splashFrame, 3, 1, 0);
    end);
	self:UnregisterEvent("PLAYER_ENTERING_WORLD");	
end);

-- Slash Command to show splash screen
SLASH_TOGGLESPLASH1 = "/splash"
SlashCmdList.TOGGLESPLASH = function(arg) -- Splash display
	print("|cffff0000Please eat more chicken.(with BBQ)");
end