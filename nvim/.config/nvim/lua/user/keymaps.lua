local utils = require("user.utils")

local options = { noremap = true, silent = true }

local keymap = vim.keymap

keymap.set("", "<Space>", "<Nop>", options)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
local normal_mode_keymaps = {
	-- No highlight
	["<Leader>no"] = ":noh<CR>",
	-- Resize with arrows
	["<C-Up>"] = ":resize -2<CR>",
	["<C-Down>"] = ":resize +2<CR>",
	["<C-Left>"] = ":vertical resize -2<CR>",
	["<C-Right>"] = ":vertical resize -2<CR>",
	["<Tab>"] = ":bnext<CR>",
	["<S-Tab>"] = ":bprevious<CR>",
	-- Let J stay in place
	["J"] = "mzJ`z",
	-- Let cursor stay in center
	["<C-d>"] = "<C-d>zz",
	["<C-u>"] = "<C-u>zz",
	-- Also let cursor stay in center when searching
	["n"] = "nzzzv",
	["N"] = "Nzzzv",
	-- Yank in clipboard
	["<Leader>y"] = '"+y',
	["<Leader>Y"] = '"+Y',
	-- Worst thing in the universe
	["Q"] = "<nop>",
}

-- Visual --
local visual_mode_keymaps = {
	-- Stay in indent mode
	["<"] = "<gv",
	[">"] = ">gv>",
	-- Move text up and down
	["<C-j>"] = ":m '>+1<CR>gv=gv",
	["<C-k>"] = ":m '<-2<CR>gv=gv",
	["p"] = '"_dP',
	-- Yank in clipboard
	["<Leader>y"] = '"+y',
}

-- Visual Block --
local visual_block_mode_keymaps = {
	-- Move text up and down
	["J"] = ":move '>+1<CR>gv-gv",
	["K"] = ":move '<-2<CR>gv-gv",
	["<A-j>"] = ":move '>+1<CR>gv-gv",
	["<A-k>"] = ":move '<-2<CR>gv-gv",
	-- Yank in clipboard
	["<Leader>y"] = '"+y',
}

local keymaps = {
	["n"] = normal_mode_keymaps,
	["v"] = visual_mode_keymaps,
	["x"] = visual_block_mode_keymaps,
}

utils.apply_keymaps(keymaps, options)
