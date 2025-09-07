return {
	"L3MON4D3/LuaSnip",
	config = function(_, opts)
		local luasnip = require("luasnip")
		luasnip.config.set_config(opts)

		-- Load VSCode-style snippets (JSON)
		require("luasnip.loaders.from_vscode").lazy_load()

		-- Load Lua snippets from your snippets/ folder
		require("luasnip.loaders.from_lua").lazy_load({
			paths = vim.fn.stdpath("config") .. "/snippets",
		})
	end,
}
