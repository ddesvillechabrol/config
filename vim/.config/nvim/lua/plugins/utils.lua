return {
  "nvim-lua/popup.nvim",
  "tpope/vim-surround",
  "tpope/vim-repeat",
  {
    "theprimeagen/harpoon",
    config = function()
      require("harpoon").setup({
        menu = {
          width = vim.api.nvim_win_get_width(0) - 20,
        }
      })
    end,
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup({
        window = {
          width = 0.8,
        },
        plugins = {
          gitsigns = { enabled = true },
        },
      })
    end,
  },
}
