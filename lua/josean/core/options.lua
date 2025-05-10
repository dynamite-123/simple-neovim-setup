vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4 -- 4 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
-- opt.smarttab = true -- make tabing smarter (use shiftwidth at start of line)

-- Override for specific filetypes (2 spaces for html, javascriptreact, typescriptreact)
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"html",
		"css",
		"scss",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"json",
		"yaml",
		"vue",
		"svelte",
		"markdown",
	},
	callback = function()
		opt.tabstop = 2
		opt.shiftwidth = 2
	end,
})

opt.wrap = true

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

-- turn on termiguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

--backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true
opt.splitbelow = true

-- auto refresh files
opt.autoread = true -- auto-reload files changed outside of Vim
opt.updatetime = 300 -- faster completion (default is 4000ms)

-- Create compact autocommands for file change detection
local autoread_group = vim.api.nvim_create_augroup("AutoRead", { clear = true })

-- Combined handler for all relevant events
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
	group = autoread_group,
	pattern = "*",
	callback = function()
		if vim.api.nvim_get_mode().mode ~= "c" then -- Don't refresh when in command line mode
			vim.cmd("checktime")
		end
	end,
})

-- Notification after file change
vim.api.nvim_create_autocmd("FileChangedShellPost", {
	group = autoread_group,
	pattern = "*",
	callback = function()
		vim.notify("File changed on disk. Buffer reloaded.", vim.log.levels.WARN)
	end,
})
