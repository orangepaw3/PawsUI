-- I would just make a frame and set the bottom left point to the bottom left of the UIParent,
-- and the bottom right to the bottom right of the UIParent, then just set your height
-- so:

local databarl = CreateFrame("frame", "MyLB", UIParent);
databarl:SetPoint("BOTTOMLEFT");
databarl:SetPoint("BOTTOMRIGHT");
databarl:SetHeight(25);
-- and then add a background texture to the frame and then place stuff on it
local databarTexture = databarl:CreateTexture(MyLB, "LOW");
databarTexture:SetTexture("Interface\\Addons\\PawsUI\\Art\\bgs.tga");
databarTexture:SetAllPoints(databarl);
databarTexture:SetHorizTile(true);
databarTexture:SetVertTile(true);
databarl.texture = databarTexture


-- end of file