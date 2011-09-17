--http://www.wowwiki.com/PowerType
--http://www.wowwiki.com/API_UnitPower
--http://wowprogramming.com/docs/events

local T, C, L = unpack(Tukui)

-- TODO: 
-- DK: runes + runic power
Options = {
	["ROGUE"] = {
		-- Config for combo points
		["core"] = {
			count = 5,
			spacing = T.Scale(3), 
			width = T.Scale(50),  
			height = T.Scale(15), 
			anchor = {"CENTER", UIParent, "CENTER", -100, -100},
			kind = "COMBO",
		},
		
		-- Coloring options
		["colors"] = { 
			[1] = {.69, .31, .31, 1},
			[2] = {.65, .42, .31, 1},
			[3] = {.65, .63, .35, 1},
			[4] = {.46, .63, .35, 1},
			[5] = {.33, .63, .33, 1},
		},
		
		-- Power plugin options
		["power"] = {
			display = true,
			autohide = true,
			kind = SPELL_POWER_ENERGY,
			text = true,
			width = T.Scale(262), -- perfectly fits width of combo points
			height = T.Scale(10),
		},
		
		-- Point display plugin options
		["points"] = {
			display = true,
		},
	},
	["PALADIN"] = {
		-- Config for combo points
		["core"] = {
			count = 3,
			spacing = T.Scale(3), 
			width = T.Scale(85),  
			height = T.Scale(15), 
			anchor = {"CENTER", UIParent, "CENTER", -630, 190},
			kind = "HOLY POWER",
			fill = true,
		},
		
		-- Coloring options
		["colors"] = { 
			[1] = { 228/255, 225/255, 16/255, 1 },
			[2] = { 228/255, 225/255, 16/255, 1 },
			[3] = { 228/255, 225/255, 16/255, 1 },
		},
		
		-- Power plugin options
		["power"] = {
			display = true,
			autohide = false,
			kind = SPELL_POWER_MANA,
			text = false,
			width = T.Scale(261), -- perfectly fits width of holy power
			height = T.Scale(10),
			color = { 0, 0, 1, 1 },
		},
		
		-- Point display plugin options
		["points"] = {
			display = false,
		},
	},
	["DRUID"] = {
		-- Config for combo points
		["core"] = {
			count = 5,
			spacing = T.Scale(3), 
			width = T.Scale(50),  
			height = T.Scale(15), 
			anchor = {"CENTER", UIParent, "CENTER", -100, -100},
			kind = "COMBO",
		},
		
		-- Coloring options
		["colors"] = { 
			[1] = {.69, .31, .31, 1},
			[2] = {.65, .42, .31, 1},
			[3] = {.65, .63, .35, 1},
			[4] = {.46, .63, .35, 1},
			[5] = {.33, .63, .33, 1},
		},
		
		-- Power plugin options
		["power"] = {
			display = true,
			autohide = true,
			kind = SPELL_POWER_ENERGY,
			text = true,
			width = T.Scale(262), -- perfectly fits width of combo points
			height = T.Scale(10),
		},
		
		-- Point display plugin options
		["points"] = {
			display = true,
		},
	},
}