-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "onedark",

	hl_override = {
    Type = { italic = true },
    SpecialComment = { italic = true },
    TSAttribute = { italic = true },
    TSParameter = { italic = true },
    TSLabel = { italic = true },
    TSVariableBuiltin = { italic = true },
    TSTagAttribute = { italic = true },
    Function = { italic = true },
    Comment = { italic = true },
	},

  tabufline = {
    enabled = false,
  },
}

return M
