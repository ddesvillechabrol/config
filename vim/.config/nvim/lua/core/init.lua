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
  },
  sections = {
    lualine_b = {'branch', 'diff', {'diagnostics', symbols = {error = ' ', warn = ' ', info = '󰋽 ', hint = '󰌶 '},}}
  },
}
require("nvim-autopairs").setup()
require("nvim-ts-autotag").setup()
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

