return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup {
        on_attach = function(bufnr)
          vim.keymap.set("n", "<leader>hs", ":Gitsigns stage_hunk<CR>")
          vim.keymap.set("n", "<leader>hr", ":Gitsigns reset_hunk<CR>")
          vim.keymap.set("n", "<leader>hu", ":Gitsigns undo_stage_hunk<CR>")
          vim.keymap.set("n", "<leader>hp", ":Gitsigns preview_hunk<CR>")
          vim.keymap.set("n", "<leader>hd", ":Gitsigns diffthis<CR>")
        end
      }
    end,
  },
  "tpope/vim-fugitive"
}
