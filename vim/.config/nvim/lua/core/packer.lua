return require('packer').startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  -- Quality of life
  use "nvim-tree/nvim-tree.lua"
  use "nvim-tree/nvim-web-devicons"
  use "nvim-lua/plenary.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-telescope/telescope.nvim"
  use "folke/zen-mode.nvim"
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  use "windwp/nvim-autopairs"
  use "windwp/nvim-ts-autotag"
  use "tpope/vim-surround"
  use "tpope/vim-repeat"
  use "lukas-reineke/indent-blankline.nvim"
  use "leafgarland/typescript-vim"
  use "peitalin/vim-jsx-typescript"
  use "Vimjas/vim-python-pep8-indent"

  -- git
  use "lewis6991/gitsigns.nvim"
  use "sindrets/diffview.nvim"
  use "TimUntersberger/neogit"

  -- LSP
  use "neovim/nvim-lspconfig"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/nvim-cmp"
  use "folke/trouble.nvim"
  use "jose-elias-alvarez/null-ls.nvim"

  -- Color scheme
  use {"catppuccin/nvim", as = "catppuccin"}
  use "nvim-lualine/lualine.nvim"
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
  -- use 'nvim-treesitter/playground'
  use "nvim-treesitter/nvim-treesitter-context"
  use {"snakemake/snakemake", rtp = "misc/vim/"}
  use "rbberger/vim-singularity-syntax"
end)
