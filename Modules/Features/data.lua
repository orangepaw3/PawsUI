-- I would just make a frame and set the bottom left point to the bottom left of the UIParent,
-- and the bottom right to the bottom right of the UIParent, then just set your height
-- so:

local databarl = CreateFrame("Frame", "MyLowerBar", UIParent);
databarl:SetPoint("BOTTOMLEFT");
databarl:SetPoint("BOTTOMRIGHT");
databarl:SetHeight(20);
-- and then add a background texture to the frame and then place stuff on it
-- MyBar in this example is a global variable name for the bar, you may not want that...


-- end of file