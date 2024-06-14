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
    config = function()
      vim.g.copilot_enabled = false
      vim.g.copilot_no_tab_map = true
      vim.keymap.set("i", "<C-j>", "<Plug>(copilot-next)", { noremap = false })
      vim.keymap.set("i", "<C-k>", "<Plug>(copilot-previous)", { noremap = false })
      vim.keymap.set("i", "<C-h>", "<Plug>(copilot-dismiss)", { noremap = false })
      vim.keymap.set(
        "i",
        "<C-l>",
        "copilot#Accept('<CR>')",
        { noremap = true, silent = true, expr = true, replace_keycodes = false }
      )
    end,
  },
  "saadparwaiz1/cmp_luasnip",
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle focus=true<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>gr",
        "<cmd>Trouble lsp_references toggle<cr>",
        desc = "LSP References (Trouble)",
      },
      {
        "<leader>xl",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xq",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    }
  },
}
