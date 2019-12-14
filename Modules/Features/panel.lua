local BottomPane = CreateFrame("Frame", "BottomPane", UIParent) -- creates a frame named BottomPane. Note, we also set a variable called bottompane.
BottomPane:Hide() -- Hides the frame until triggered by default for testing.
BottomPane:SetFrameStrata("LOW"); -- Sets the strata.
ScreenW = GetScreenWidth(); -- Gets the Screen Width.
ScreenH = GetScreenHeight(); -- Gets the Screen Height.
BottomPane:SetWidth(ScreenW); -- Sets the width of the "panel" to the screen width regardless of size.
BottomPane:SetHeight(100); -- Sets the height of the "panel" to 100.

local BPTex = BottomPane:CreateTexture(nil, "LOW"); -- Sets the texture to Low strata.
BPTex:SetTexture("Interface\\Addons\\PawsUI\\Art\\bg.tga"); -- Sets the actual texture.
BPTex:SetAllPoints(BottomPane); -- Sets all the points to "BottomPane."
BottomPane.texture = BPTex -- Identifies "BottomPane's" texture to the variable name BPTex.
BottomPane:SetPoint("BOTTOM",0,0) -- Places it at the bottom.
BPTex:SetVertexColor(0, 0, 0, 0.6); -- Makes it (the texture) translucent.

--[[ I need to use this for the /afk feature ]]

SLASH_PANE1 = "/pane"; -- creates the slash command to toggle the pane on and off.
SlashCmdList.PANE = function(arg)
  BottomPane:SetShown(not BottomPane:IsVisible())
  PlayerFrame:SetShown(not PlayerFrame:IsVisible())
  MinimapCluster:SetShown(not MinimapCluster:IsVisible())
end

-- end of file
