local builtin = require "telescope.builtin"
local utils = require "user.utils"

-- Normal Mode keymaps
local normal_mode_keymaps = {
  -- Search [p]roject [f]iles
  ["<Leader>pf"] = builtin.find_files,

  -- Search [p]roject files in from git
  ["<C-p>"] = builtin.git_files,
  ["<Leader>ps"] = function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
  end,
}

local keymaps = {
  ["n"] = normal_mode_keymaps
}

utils.apply_keymaps(keymaps, {})
