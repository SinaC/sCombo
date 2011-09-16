-- sCombo
local T, C, L = unpack(Tukui)

local class = select(2, UnitClass("player"))
local classOptions = Options[class]
if ( classOptions == nil ) then return end
local O = classOptions["points"]
if O.display ~= true then return end
local kind = classOptions["core"].kind
local count = classOptions["core"].count

local f = CreateFrame("Frame")
local text = T.SetFontString(sCombo[1], C.media.font, 20, "THINOUTLINE")
text:Point("BOTTOM", sCombo[(count+1)/2], "TOP", 0, 3)
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("UNIT_COMBO_POINTS")
f:RegisterEvent("PLAYER_TARGET_CHANGED")
f:RegisterEvent("UNIT_POWER")
f:SetScript("OnEvent", function(self, event)
	local points = 0
	if ( kind == "COMBO" ) then
		points = GetComboPoints("player", "target")
	elseif ( kind == "HOLY POWER" ) then
		points = UnitPower("player",SPELL_POWER_HOLY_POWER)
	end
	text:SetText(points)
end)