local group_names = {
  "Normal",
  "SignColumn",
  "NormalNC",
  "MsgArea",
  "TelescopeBorder",
  "TelescopePrompt",
  "NvimTreeNormal",
}

local function apply_colorscheme(colorscheme)
  local toApply = colorscheme or "catppuccin-macchiato"
  vim.cmd.colorscheme(toApply)

  for _, group_name in pairs(group_names) do
    vim.api.nvim_set_hl(0, group_name, { bg = "none" })
  end
end

apply_colorscheme()
