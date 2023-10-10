local flavour = "mocha"

require("catppuccin").setup({
  flavour = flavour, -- latte, frappe, macchiato, mocha
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
      LineNr = { fg = colors.surface2 },
      CursorLineNr = { fg = colors.flamingo },
      CursorLine = { bg = colors.none },
    }
  end,
  integrations = {
    neogit = true,
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    telescope = true,
    treesitter = true,
    treesitter_context = true,
    lsp_trouble = true,
    harpoon = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
  },
})


local colors = require("catppuccin.palettes").get_palette(flavour)

vim.cmd(string.format([[highlight IndentBlanklineIndent guifg=%s gui=nocombine]], colors.surface2))
require("ibl").setup {
  indent = { highlight = "IndentBlanklineIndent", char = "▏", smart_indent_cap = false },
  scope = { enabled = false },
}

vim.api.nvim_set_hl(0, "@tag.attribute.tsx", { fg = colors.blue })
vim.api.nvim_set_hl(0, "@include.tsx", { fg = colors.sky, bold = true })
vim.api.nvim_set_hl(0, "@keyword.tsx", { fg = colors.red, italic = true })
vim.api.nvim_set_hl(0, "@keyword.function.tsx", { fg = colors.red, italic = true })
vim.api.nvim_set_hl(0, "@constructor.tsx", { fg = colors.peach })

vim.api.nvim_set_hl(0, "@tag.attribute.typescript", { fg = colors.blue })
vim.api.nvim_set_hl(0, "@include.typescript", { fg = colors.sky, bold = true })
vim.api.nvim_set_hl(0, "@keyword.export.typescript", { fg = colors.sky, bold = true })
vim.api.nvim_set_hl(0, "@keyword.typescript", { fg = colors.red })
vim.api.nvim_set_hl(0, "@keyword.function.typescript", { fg = colors.red })
vim.api.nvim_set_hl(0, "@constructor.typescript", { fg = colors.peach })

vim.cmd("colorscheme catppuccin")

local signs = { Error = "", Warn = "", Hint = "󰌶", Info = "󰋽" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
