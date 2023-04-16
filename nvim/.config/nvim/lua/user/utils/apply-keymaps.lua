local keymap = vim.keymap

local function apply_keymaps(keymaps, options)
  for mode, key_bindings in pairs(keymaps) do
    for key, binding in pairs(key_bindings) do
      keymap.set(mode, key, binding, options)
    end
  end

end

return apply_keymaps
