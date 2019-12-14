local addonName, addonData = ...
--[[ Sometimes, it takes 19 tries to do something you are new at.  The code below makes it
when a player enters the world, the welcome message appears. ]]
local PLAYER_LOGIN
print("|cffFFFFFFThank you for using |cffFF45Paws|cFFFFFFUI: Version: |cffFF99002.0!|r");
print("|cffff0000Please Note:|r You can use /pui for help.");

-- Slash Commands
SLASH_RELOADUI1 = "/rl"
SlashCmdList.RELOADUI = ReloadUI -- this section allows for fast reloading
--------------------------------------------------------------------------
SLASH_TOGGLEGRID1 = "/align"
SlashCmdList.TOGGLEGRID = function(arg)  -- Grid Display
  if isAligning then
      Grid_Hide()
      isAligning = false
  else
      boxSize = (math.ceil((tonumber(arg) or boxSize) / 32) * 32)
  if boxSize > 256 then boxSize = 256 end
      Grid_Show()
      isAligning = true
  end
end -- End Grid Display
--------------------------------------------------------------------------
SLASH_PUIHELP1 = "/pui"
SlashCmdList.PUIHELP = function(args) -- Shows PawsUI Help
print("|cffFF9900Paws|cffFFFFFFUI: |cffFF9900Help|r")
print("|cffFF9900/rl |r(Reload the UI)")
print("|cffFF9900/align |r(Show the Alignment Grid)")
print("|cffFF9900/pui |r(This List)")
print("|cffFF9900/lug |r(Level Up Test)")
--------------------------------------------------------------------------

for i = 1, NUM_CHAT_WINDOWS do
  _G["ChatFrame"..i.."EditBox"]:SetAltArrowKeyMode(false)
end
end

-- Font Functions
PawsFonts = CreateFrame("Frame", "PawsFonts");

local fonta = "Interface\\AddOns\\PawsUI\\Fonts\\big_noodle_titling.ttf"
local shadow = true

function PawsFonts:ApplySystemFonts()

STANDARD_TEXT_FONT = fonta
DAMAGE_TEXT_FONT = fonta
UNIT_NAME_FONT   = fonta


ZoneTextString:SetFont(fonta, 30, "NONE")
ZoneTextString:SetShadowColor(0, 0, 0)
ZoneTextString:SetShadowOffset(1, -1)

SubZoneTextString:SetFont(fonta, 30, "NONE")
SubZoneTextString:SetShadowColor(0, 0, 0)
SubZoneTextString:SetShadowOffset(1, -1)

PVPInfoTextString:SetFont(fonta, 16, "NONE")
PVPInfoTextString:SetShadowColor(0, 0, 0)
PVPInfoTextString:SetShadowOffset(1, -1)

PVPArenaTextString:SetFont(fonta, 16, "NONE")
PVPArenaTextString:SetShadowColor(0, 0, 0)
PVPArenaTextString:SetShadowOffset(1, -1)


end

PawsFonts:RegisterEvent("ADDON_LOADED");

PawsFonts:ApplySystemFonts()

-- End