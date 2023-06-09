local options = {
  backup = false,
  cmdheight = 2,
  colorcolumn = "99999",
  completeopt = { "menuone", "noselect" },
  conceallevel = 0,
  fileencoding = "utf-8",
  foldcolumn = '1', -- '0' is not bad
  foldlevel = 99,   -- Using ufo provider need a large value, feel free to decrease the value
  foldlevelstart = 99,
  foldenable = true,
  guifont = "monospace:h17",
  hidden = true,
  hlsearch = true,
  incsearch = true,
  ignorecase = true,
  mouse = "a",
  pumheight = 10,
  showmode = false,
  showtabline = 2,
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = true,
  timeoutlen = 100,
  title = true,
  titlestring = "%<%F%=%l/%L - nvim",
  undodir = vim.fn.stdpath "cache" .. "/undo",
  undofile = true,
  updatetime = 50,
  writebackup = false,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = true,
  number = true,
  relativenumber = true,
  numberwidth = 4,
  signcolumn = "yes",
  wrap = false,
  spell = false,
  spelllang = "en",
  scrolloff = 8,
  sidescrolloff = 8,
}

for option, value in pairs(options) do
  vim.opt[option] = value
end
