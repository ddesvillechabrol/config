local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		prompt_prefix = " >",
		color_devicons = true,
		mappings = {
			i = {
        ["<C-c>"] = actions.delete_buffer,
				["<C-x>"] = false,
				["<C-q>"] = actions.send_to_qflist,
        ["<CR>"] = actions.select_default,
			},
		},
	},
    --[[
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
	},
    ]]
})
