-- sCombo
local T, C, L = unpack(Tukui)

local class = select(2, UnitClass("player"))
local classOptions = Options[class]
if ( classOptions == nil ) then return end
local O = classOptions["core"]
local kind = O.kind

local count = O.count
local sCombo = CreateFrame("Frame", "sCombo", UIParent)
for i = 1, count do
	sCombo[i] = CreateFrame("Frame", "sCombo"..i, UIParent)
	sCombo[i]:CreatePanel("Default", O.width, O.height, "CENTER", UIParent, "CENTER", 0, 0)
	sCombo[i]:CreateShadow("Default")
		
	if i == 1 then
		sCombo[i]:Point(unpack(O.anchor))
	else
		sCombo[i]:Point("LEFT", sCombo[i-1], "RIGHT", O.spacing, 0)
	end
	
	--sCombo[i]:SetBackdropBorderColor(unpack(classOptions["colors"][i]))
	sCombo[i]:SetBackdropColor(unpack(classOptions["colors"][i]))
	sCombo[i]:RegisterEvent("PLAYER_ENTERING_WORLD")
	sCombo[i]:RegisterEvent("UNIT_COMBO_POINTS")
	sCombo[i]:RegisterEvent("UNIT_POWER")
	sCombo[i]:RegisterEvent("PLAYER_TARGET_CHANGED")
	sCombo[i]:SetScript("OnEvent", function()
		local points = 0
		if ( kind == "COMBO" ) then
			points = GetComboPoints("player", "target")
		elseif ( kind == "HOLY POWER" ) then
			points = UnitPower("player",SPELL_POWER_HOLY_POWER)
		end
		if points and points > 0 then
			for i = 1, points do sCombo[i]:Show() end
			for i = points+1, count do sCombo[i]:Hide() end
		else
			for i = 1, count do sCombo[i]:Hide() end
		end
	end)
end