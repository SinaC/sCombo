--http://www.wowwiki.com/PowerType
--http://www.wowwiki.com/API_UnitPower
--http://wowprogramming.com/docs/events

local T, C, L = unpack(Tukui)

-- TODO: 
-- instead of class
-- COMBO: combo + energy
-- HOLY: holy power + mana
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
		},
		
		-- Coloring options
		["colors"] = { 
			--[1] = {.69, .31, .31, 1},
			-- [2] = {.65, .42, .31, 1},
			-- [3] = {.65, .63, .35, 1},
			[1] = { 0.94, 0.78, 0, 1 },
			[2] = { 0.94, 0.78, 0, 1 },
			[3] = { 0.94, 0.78, 0, 1 },
		},
		
		-- Power plugin options
		["power"] = {
			display = true,
			autohide = false,
			kind = SPELL_POWER_MANA,
			text = false,
			width = T.Scale(261), -- perfectly fits width of holy power
			height = T.Scale(10),
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