-- Paw's Tooltips V1.0 Credit and Thanks go to Paul Emmerich
-- This addon will give you mouseover tooltips on various things in WoW.
-- It currently works in WoW: legion 7.1.2
--
local function showtooltip(self, linkData)  -- this function links the data from items and whatnot to the game tooltip
	local linkType = string.split(":", linkData)
	if linkType == "item" -- items
	or linkType == "spell" -- spells
	or linkType == "achievement" -- achievements
	or linkType == "unit"  -- units
	or linkType == "enchant"  -- enchants on items
	or linkType == "instance"  -- testing this, working on implimenting it.
	or linkType == "raid" -- testing this, working on implimenting it.
	or linkType == "quest" -- quests
	or linkType == "glyph" -- glyphs
	or linkType == "talent" then -- talents
		GameTooltip:SetOwner(self, "ANCHOR_CURSOR")  -- this says the owner of the tooltip is self, the mouse cursor
		GameTooltip:SetHyperlink(linkData) -- this sets the link to the game tooltip
		--GameTooltip:show() <- this has been commented out due to updates
	end
end

local function hidetooltip() -- the function to hide the tooltip
	GameTooltip:Hide()
end
---------------------------------
local function set0rhookhandler(frame, script, func)
	if frame:GetScript(script) then -- check if it already has a script handler...
	   frame:HookScript(script, func) -- and hook it...
	else
		frame:SetScript(script, func) -- set our function as script handler otherwise
	end
end
---------------------------------
for i = 1, NUM_CHAT_WINDOWS do
	local frame = getglobal("ChatFrame"..i) --copy a reference
	if frame then -- make sure the frameexists
		set0rhookhandler(frame, "OnHyperLinkEnter", showtooltip)
		set0rhookhandler(frame, "OnHyperLinkLeave", hidetooltip)
	end
end
