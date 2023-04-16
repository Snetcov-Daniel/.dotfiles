local mark = require "harpoon.mark"
local ui = require "harpoon.ui"
local utils = require "user.utils"

-- Normal Mode keymaps
local normal_mode_keymaps = {
  -- Mark file
  ["<Leader>ha"] = mark.add_file,

  ["<Leader>he"] = ui.toggle_quick_menu,

  -- Keymaps to first 4 marked files
  ["<C-h>"] = function() ui.nav_file(1) end,
  ["<C-j>"] = function() ui.nav_file(2) end,
  ["<C-k>"] = function() ui.nav_file(3) end,
  ["<C-l>"] = function() ui.nav_file(4) end,
}

vim.api.nvim_set_keymap('n', '<C-;>', ':lua print("hello")<CR>', {noremap=true})

local keymaps = {
  ["n"] = normal_mode_keymaps,
}

utils.apply_keymaps(keymaps, {})
