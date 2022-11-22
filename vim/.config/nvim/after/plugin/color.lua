require("catppuccin").setup({
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    transparent_background = true,
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    -- https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/groups/editor.lua
    custom_highlights = function(colors)
      return {
        LineNr = { fg = colors.overlay1 },
        CursorLineNr = { fg = colors.flamingo },
      }
    end,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        ts_rainbow = true,
        lsp_trouble = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false,
        },
    },
})


vim.cmd [[highlight IndentBlanklineIndent guifg=#8087a2 gui=nocombine]]
require("indent_blankline").setup {
  char_highlight_list = {
    "IndentBlanklineIndent",
  }
}

vim.cmd("colorscheme catppuccin")

