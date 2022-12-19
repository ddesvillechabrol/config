require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    sync_install = false,

    highlight = {
        enable = true,
        -- I had some indent bug without vim regex highlighting in python
        additional_vim_regex_highlighting = { "python" },
    },
    indent = {
      enable = true,
      disable = { python, typescript, tsx }
    }
}

local colors = require("catppuccin.palettes").get_palette("macchiato")

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

