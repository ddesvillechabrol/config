-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<leader>d", [["_d]])
vim.keymap.set("v", "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)
vim.keymap.set("n", "<leader>lf", function()
    vim.lsp.buf.format({ timeout_ms = 5000 })
end)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Switch between buffer
vim.keymap.set("n", "<C-S-Down>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<C-S-Up>", "<cmd>bprevious<CR>")

-- Close buffer
vim.keymap.set("n", "<C-c>", "<cmd>bp|bd #<CR>")

-- Switch between windows
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<Leader>b", "<C-^>")

-- copy current file path
vim.keymap.set("n", "<F4>", '<cmd>let @+=expand("%:p")<CR>')

-- nvim-tree
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>")

-- nvim-zen
vim.keymap.set("n", "<Leader>z", "<cmd>ZenMode<CR>")

