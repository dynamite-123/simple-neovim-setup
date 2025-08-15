return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		-- manually setup nvim-ts-autotag (modern usage)
		require("nvim-ts-autotag").setup()

		-- safe wrappers for incremental selection
		local ts_utils = require("nvim-treesitter.ts_utils")
		local inc_sel = require("nvim-treesitter.incremental_selection")

		local function safe_init_selection()
			local node = ts_utils.get_node_at_cursor()
			if not node then
				return
			end
			inc_sel.init_selection()
		end

		local function safe_node_incremental()
			local node = ts_utils.get_node_at_cursor()
			if not node then
				return
			end
			inc_sel.node_incremental()
		end

		-- keymaps using safe versions
		vim.keymap.set("n", "<C-space>", safe_init_selection, { silent = true })
		vim.keymap.set("x", "<C-space>", safe_node_incremental, { silent = true })
		vim.keymap.set("x", "<bs>", inc_sel.node_decremental, { silent = true })

		-- configure treesitter
		---@diagnostic disable-next-line: missing-fields
		treesitter.setup({
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"prisma",
				"markdown",
				"markdown_inline",
				"svelte",
				"graphql",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"query",
				"vimdoc",
				"python",
				"cpp",
				"java",
				"sql",
				"c",
			},
			auto_install = true, -- automatically install missing parsers
			sync_install = false, -- non-blocking parser install
			incremental_selection = {
				enable = true,
				-- no keymaps here because we set them manually above
			},
		})
	end,
}
