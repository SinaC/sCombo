-- Power Plugin
local T, C, L = unpack(Tukui)

local class = select(2, UnitClass("player"))
local classOptions = Options[class]
if ( classOptions == nil ) then return end
local O = classOptions["power"]
if O.display ~= true then return end
local kind = O.kind

local sPowerBG = CreateFrame("Frame", "sPowerBG", UIParent)
local sPowerText = T.SetFontString(sPowerBG, C.media.font, 20, "THINOUTLINE")
sPowerText:Point("TOP", sPowerBG, "BOTTOM", 0, -3)
sPowerBG:CreatePanel(nil, O.width , O.height, "TOPLEFT", sCombo[1], "BOTTOMLEFT", 0, -3)
sPowerBG.sStatus = CreateFrame("StatusBar", "sStatus", sPowerBG)
sPowerBG.sStatus:SetStatusBarTexture(C.media.normTex)
sPowerBG.sStatus:SetFrameLevel(6)
sPowerBG.sStatus:Point("TOPLEFT", sPowerBG, "TOPLEFT", 2, -2)
sPowerBG.sStatus:Point("BOTTOMRIGHT", sPowerBG, "BOTTOMRIGHT", -2, 2)
sPowerBG.sStatus:SetScript("OnUpdate", function()
	local value = UnitPower("player")
    sPowerBG.sStatus:SetMinMaxValues(0, UnitPowerMax("player"))
    sPowerBG.sStatus:SetValue(value)

	local color = RAID_CLASS_COLORS[T.myclass]
	local r, g, b
	r = color.r
	g = color.g
	b = color.b
	if ( O.color ) then
		r, g, b = unpack(O.color)
	end
	sPowerBG.sStatus:SetStatusBarColor(r, g, b)
	--sPowerBG.sStatus:SetStatusBarColor( unpack( color ) )

	--DEFAULT_CHAT_FRAME:AddMessage("Value: "..value)
	if ( O.text == true ) then
		sPowerText:SetText(value)
	end
end)
sPowerBG:RegisterEvent("PLAYER_ENTERING_WORLD")
sPowerBG:RegisterEvent("UNIT_DISPLAYPOWER")
sPowerBG:RegisterEvent("PLAYER_REGEN_DISABLED")
sPowerBG:RegisterEvent("PLAYER_REGEN_ENABLED")
sPowerBG:RegisterEvent("UNIT_POWER")
if ( O.autohide == true ) then
	sPowerBG:SetScript("OnEvent", function(self, event)
		local p, pname = UnitPowerType("player")
		--DEFAULT_CHAT_FRAME:AddMessage("Power: "..p.."  "..pname)
		--if p == SPELL_POWER_ENERGY then
		if p == kind then
			if event == "PLAYER_REGEN_DISABLED" then
				sPowerBG:Show()
			elseif event == "UNIT_POWER" then
				if InCombatLockdown() then
					sPowerBG:Show()
				end
			else
				sPowerBG:Hide()
			end
		else
			sPowerBG:Hide()
		end
	end)
end
