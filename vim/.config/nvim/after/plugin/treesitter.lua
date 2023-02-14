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

