return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		local comment = require("Comment")
		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		comment.setup({
			pre_hook = ts_context_commentstring.create_pre_hook(),
		})

		-- Ctrl + / in normal mode
		vim.keymap.set("n", "<C-_>", function()
			require("Comment.api").toggle.linewise.current()
		end, { noremap = true, silent = true })

		-- Ctrl + / in visual mode
		vim.keymap.set("v", "<C-_>", function()
			local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
			vim.api.nvim_feedkeys(esc, "nx", false)
			require("Comment.api").toggle.linewise(vim.fn.visualmode())
		end, { noremap = true, silent = true })
	end,
}
