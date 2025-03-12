return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local nvimtree = require("nvim-tree")
		local api = require("nvim-tree.api")

		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		local config = {
			view = {
				width = 35,
				adaptive_size = true,
			},
			renderer = {
				indent_markers = {
					enable = true,
				},
				group_empty = true,
				highlight_git = true,
			},
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
				dotfiles = true,
			},
			git = {
				ignore = false,
			},
		}

		nvimtree.setup(config)

		-- set keymaps
		local keymap = vim.keymap

		keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
		keymap.set(
			"n",
			"<leader>ef",
			"<cmd>NvimTreeFindFileToggle<CR>",
			{ desc = "Toggle file explorer on current file" }
		)
		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
		keymap.set(
			"n",
			"<leader>en",
			"<cmd>set relativenumber!<CR>",
			{ desc = "Toggle file explorer relative numbers" }
		)

		-- Toggle for group_empty with real-time update
		keymap.set("n", "<leader>et", function()
			config.renderer.group_empty = not config.renderer.group_empty
			nvimtree.setup(config)
			-- Close and reopen the tree to apply changes
			-- api.tree.close()
			-- api.tree.open()
			api.tree.toggle(false, true)
			print("group_empty is now " .. tostring(config.renderer.group_empty))
		end, { desc = "Toggle group empty in nvim-tree" })
	end,

	--
}
