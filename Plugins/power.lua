-- Power Plugin
local T, C, L = unpack(Tukui)

local class = select(2, UnitClass("player"))
local classOptions = Options[class]
if ( classOptions == nil ) then return end
local O = classOptions["power"]
if O.display ~= true then return end

local kind = O.kind
local r, g, b
if ( O.color ) then
	r, g, b = unpack(O.color)
else
	local color = RAID_CLASS_COLORS[T.myclass]
	r = color.r
	g = color.g
	b = color.b
end

local sPowerBG = CreateFrame("Frame", "sPowerBG", UIParent)
if ( O.anchor ~= nil ) then
	sPowerBG:CreatePanel(nil, O.width , O.height, unpack(O.anchor))
else
	sPowerBG:CreatePanel(nil, O.width , O.height, "TOPLEFT", sCombo[1], "BOTTOMLEFT", 0, -3)
end

local sPowerText = T.SetFontString(sPowerBG, C.media.font, 20, "THINOUTLINE")
sPowerText:Point("TOP", sPowerBG, "BOTTOM", 0, -3)

sPowerBG.sStatus = CreateFrame("StatusBar", "sStatus", sPowerBG)
sPowerBG.sStatus:SetStatusBarTexture(C.media.normTex)
sPowerBG.sStatus:SetMinMaxValues(0, UnitPowerMax("player"))
sPowerBG.sStatus:SetStatusBarColor(r, g, b)
sPowerBG.sStatus:SetFrameLevel(6)
sPowerBG.sStatus:Point("TOPLEFT", sPowerBG, "TOPLEFT", 2, -2)
sPowerBG.sStatus:Point("BOTTOMRIGHT", sPowerBG, "BOTTOMRIGHT", -2, 2)

if ( O.text == true ) then
	sPowerBG.text = sPowerBG.sStatus:CreateFontString(nil, "OVERLAY")
	sPowerBG.text:SetFont(C.media.uffont, 12)
	sPowerBG.text:Point("CENTER", sPowerBG.sStatus)
	sPowerBG.text:SetShadowColor(0, 0, 0)
	sPowerBG.text:SetShadowOffset(1.25, -1.25)
end

local OnUpdate = function(self)
	local value = UnitPower("player")
    self.sStatus:SetValue(value)

	if ( O.text == true ) then
		sPowerBG.text:SetText(value)
	end
end

local OnShow = function(self)
	self:SetScript("OnUpdate", OnUpdate)
end

local OnHide = function(self)
	self:SetScript("OnUpdate", nil)
end

sPowerBG:RegisterEvent("PLAYER_ENTERING_WORLD")
sPowerBG:RegisterEvent("UNIT_DISPLAYPOWER")
sPowerBG:RegisterEvent("PLAYER_REGEN_DISABLED")
sPowerBG:RegisterEvent("PLAYER_REGEN_ENABLED")
sPowerBG:RegisterEvent("UNIT_POWER")
sPowerBG:SetScript("OnEvent", function(self, event)
	local valueMax = UnitPowerMax("player")
	self.sStatus:SetMinMaxValues(0, valueMax)
	local p, pname = UnitPowerType("player")
	if ( O.autohide == true ) then
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
	end
end)

sPowerBG:SetScript("OnShow", OnShow) -- This is what stops constant OnUpdate
sPowerBG:SetScript("OnHide", OnHide)

-- If autohide is not set, show frame
if ( O.autohide ~= true ) then
	if ( sPowerBG:IsShown() ) then
		self:SetScript("OnUpdate", OnUpdate)

	else
		sPowerBG:Show()
	end
end