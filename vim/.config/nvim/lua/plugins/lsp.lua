return {
  "neovim/nvim-lspconfig",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/nvim-cmp",
  "jose-elias-alvarez/null-ls.nvim",
  "L3MON4D3/LuaSnip",
  {
    "github/copilot.vim",
    config = function ()
      vim.g.copilot_enabled = false
      vim.g.copilot_no_tab_map = true
      vim.keymap.set("i", "<C-j>", "<Plug>(copilot-next)", { noremap = false })
      vim.keymap.set("i", "<C-k>", "<Plug>(copilot-previous)", { noremap = false })
      vim.keymap.set("i", "<C-h>", "<Plug>(copilot-dismiss)", { noremap = false })
      vim.keymap.set(
        "i",
        "<C-l>",
        "copilot#Accept('<CR>')",
        { noremap = true, silent = true, expr=true, replace_keycodes = false }
      )
    end,
  },
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
