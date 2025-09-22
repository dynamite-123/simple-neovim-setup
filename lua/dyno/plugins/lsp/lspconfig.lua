return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import mason_lspconfig plugin
    local mason_lspconfig = require("mason-lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", function()
          local current_name = vim.fn.expand("<cword>")
          vim.ui.input({
            prompt = "Rename: ",
            default = current_name,
          }, function(new_name)
            if new_name and new_name ~= "" and new_name ~= current_name then
              local clients = vim.lsp.get_clients({ bufnr = 0 })
              if #clients > 0 then
                local client = clients[1]
                local params = vim.lsp.util.make_position_params(0, client.offset_encoding)
                params.newName = new_name
                vim.lsp.buf_request(0, "textDocument/rename", params)
              end
            end
          end)
        end, opts) -- smart rename

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", function() 
          vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR }) 
        end, opts) -- jump to previous error in buffer

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", function() 
          vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR }) 
        end, opts) -- jump to next error in buffer

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show diagnostics for current buffer only
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- Only show errors, hide warnings/hints/info
    vim.diagnostic.config({
      severity_sort = true,
      virtual_text = {
        severity = { min = vim.diagnostic.severity.ERROR },
      },
      float = {
        severity = { min = vim.diagnostic.severity.ERROR },
      },
      signs = {
        severity = { min = vim.diagnostic.severity.ERROR },
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
        },
      },
      underline = {
        severity = { min = vim.diagnostic.severity.ERROR },
      },
    })

    -- Manually configure each LSP server instead of using setup_handlers
    mason_lspconfig.setup()

    -- Configure pyright (other servers are configured specifically below)
    lspconfig["pyright"].setup({
      capabilities = capabilities,
    })

    -- Configure specific servers
    lspconfig["clangd"].setup({
      capabilities = capabilities,
      cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=iwyu" },
    })

    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          completion = {
            callSnippet = "Replace",
          },
        },
      },
    })
  end,
}