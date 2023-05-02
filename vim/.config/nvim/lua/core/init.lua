require("core.packer")
require("core.set")
require("core.git")
require("core.telescope")

require("nvim-tree").setup({
  sync_root_with_cwd = true,
})
require("zen-mode").setup({
  window = {
    width = 0.7,
  },
  plugins = {
    gitsigns = { enabled = true },
  },
})
require("lualine").setup {
    options = {
        theme = "catppuccin"
    }
}
require("nvim-autopairs").setup()
require("nvim-ts-autotag").setup()

