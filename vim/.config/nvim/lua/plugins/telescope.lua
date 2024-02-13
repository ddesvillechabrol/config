return {
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local actions = require("telescope.actions")
      require("telescope").setup {
        defaults = {
          file_sorter = require("telescope.sorters").get_fzy_sorter,
          prompt_prefix = " >",
          color_devicons = true,
          mappings = {
            i = {
              ["<C-x>"] = false,
              ["<C-q>"] = actions.send_to_qflist,
              ["<CR>"] = actions.select_default,
            },
            n = {
              ["<C-d>"] = actions.delete_buffer,
            }
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      }
      require("telescope").load_extension("fzf")
    end,
  }
}
