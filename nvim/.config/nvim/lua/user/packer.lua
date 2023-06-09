local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install plugins here
return packer.startup(function(use)
  use("wbthomason/packer.nvim")              -- Have packer manage itself
  use("nvim-lua/plenary.nvim")               -- Useful lua functions used by lots of plugins
  use("nvim-telescope/telescope.nvim")       -- Fuzzy finder
  use({ "nvim-treesitter/nvim-treesitter" }) -- Syntax Highlight
  use("ThePrimeagen/harpoon")                -- File pinning
  use("mbbill/undotree")                     -- file history
  use("lewis6991/gitsigns.nvim")             -- git management

  -- cmp plugins
  use("hrsh7th/nvim-cmp")         -- The completion plugin
  use("hrsh7th/cmp-buffer")       -- buffer completions
  use("hrsh7th/cmp-path")         -- path completions
  use("hrsh7th/cmp-cmdline")      -- cmdline completions
  use("saadparwaiz1/cmp_luasnip") -- snippet completions
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-nvim-lua")

  -- Snippets
  use("L3MON4D3/LuaSnip")             -- snippet engine
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
  use("saecki/crates.nvim")           -- cmp source for rust crates

  use("neovim/nvim-lspconfig")        -- enable LSP
  use({
    "williamboman/mason.nvim",
    run = ":MasonUpdate",
  })                                     -- simple to use language server installer
  use("williamboman/mason-lspconfig.nvim")
  use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
  use("RRethy/vim-illuminate")

  use("windwp/nvim-autopairs") -- autopairs for brackets

  use("ggandor/leap.nvim")     -- blazingly fast horizontal movement
  use("tpope/vim-repeat")

  use("nvim-tree/nvim-tree.lua") -- File explorer

  -- better commenting
  use("numToStr/Comment.nvim")
  use("JoosepAlviste/nvim-ts-context-commentstring")

  -- Auto saving the file
  use({
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup()
    end,
  })

  -- UI customization
  use({ "catppuccin/nvim", as = "catppuccin" })
  use("kyazdani42/nvim-web-devicons")

  use({
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup({
        -- config
      })
    end,
    requires = { "nvim-tree/nvim-web-devicons" },
  })

  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
