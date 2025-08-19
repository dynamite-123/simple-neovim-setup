vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- indent / unindent in visual mode
keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true, desc = "Indent selection" })
keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true, desc = "Unindent selection" })

-- indent / unindent in normal mode
keymap.set("n", "<Tab>", ">>", { noremap = true, silent = true, desc = "Indent line" })

keymap.set("n", "<leader>rr", function()
		local filename = vim.fn.expand("%")
		if vim.bo.filetype == "cpp" then
			-- Split horizontally for terminal at the bottom
			vim.cmd("botright split | resize 15 | term g++ " .. filename .. " -o a.out && ./a.out < input.txt")
			-- Move to the terminal window
			vim.cmd("wincmd j")
			-- Open input.txt in a vertical split to the right of the terminal (bottom right)
			vim.cmd("vsplit input.txt")
		else
			print("Not a C++ file.")
		end
	end, { desc = "Compile/run C++ with input.txt and open input.txt on right" })
keymap.set("n", "<S-Tab>", "<<", { noremap = true, silent = true, desc = "Unindent line" })
