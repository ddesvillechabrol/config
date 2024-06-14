return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require 'nvim-treesitter.configs'.setup {
        ensure_installed = "all",
        sync_install = false,

        highlight = {
          enable = true,
          -- I had some indent bug without vim regex highlighting in python
          additional_vim_regex_highlighting = { "python" },
        },
        autotag = {
          enable = true,
          enable_close_on_slash = false,
        },
        indent = {
          enable = true,
          disable = { "python" }
        },
      }
    end,
  },
  "nvim-treesitter/nvim-treesitter-context",
}
