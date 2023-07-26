return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000},
  "nvim-tree/nvim-web-devicons",
  "lukas-reineke/indent-blankline.nvim",
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup {
        options = {
          theme = "catppuccin"
        },
        sections = {
          lualine_b = {'branch', 'diff', {'diagnostics', symbols = {error = ' ', warn = ' ', info = '󰋽 ', hint = '󰌶 '},}},
          lualine_c = {{'filename', path = 1}},
        },
      }
    end,
  },
}
