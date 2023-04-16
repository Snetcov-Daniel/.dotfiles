local utils = require "user.utils"

-- Normal Mode keymaps
local normal_mode_keymaps = {
  -- Mark file
  ["<Leader>u"] = vim.cmd.UndotreeToggle,
}

local keymaps = {
  ["n"] = normal_mode_keymaps,
}

utils.apply_keymaps(keymaps, {})
