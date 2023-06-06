local nnoremap = require('core.keymap').nnoremap

require('gitsigns').setup {
  on_attach = function(bufnr)
    nnoremap("<leader>hs", ":Gitsigns stage_hunk<CR>")
    nnoremap("<leader>hr", ":Gitsigns reset_hunk<CR>")
    nnoremap("<leader>hu", ":Gitsigns undo_stage_hunk<CR>")
    nnoremap("<leader>hp", ":Gitsigns preview_hunk<CR>")
    nnoremap("<leader>hd", ":Gitsigns diffthis<CR>")
  end
}

nnoremap("<leader>gh", ":DiffviewFileHistory %<CR>")
nnoremap("<leader>vv", ":DiffviewOpen<CR>")
nnoremap("<leader>vc", ":DiffviewClose<CR>")
nnoremap("<leader>ga", "<cmd>!git fetch --all<CR>")
