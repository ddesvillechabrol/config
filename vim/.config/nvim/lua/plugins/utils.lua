return {
  "nvim-lua/popup.nvim",
  "theprimeagen/harpoon",
  "tpope/vim-surround",
  "tpope/vim-repeat",
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
