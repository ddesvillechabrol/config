return {
  "neovim/nvim-lspconfig",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/nvim-cmp",
  "jose-elias-alvarez/null-ls.nvim",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  {
    "folke/trouble.nvim",
    config = function ()
      require("trouble").setup({
        signs = {
          -- icons / text used for a diagnostic
          error = "",
          warning = "",
          hint = "󰌶",
          information = "󰋽",
          other = "󰗡"
        },
      })
    end,
  },
}
