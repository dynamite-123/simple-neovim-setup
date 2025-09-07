# Neovim Configuration

A modern Neovim setup with essential plugins for development productivity.

## 📦 Plugins

### 🔧 Core Functionality
- **LSP Config** - Language server protocol support
- **Mason** - LSP/DAP/linter/formatter installer
- **Treesitter** - Advanced syntax highlighting and parsing
- **nvim-cmp** - Autocompletion engine
- **LuaSnip** - Snippet engine

### 🔍 Navigation & Search
- **Telescope** - Fuzzy finder for files, text, and more
- **nvim-tree** - File explorer sidebar

### ✨ UI & Visual
- **Lualine** - Status line
- **Bufferline** - Buffer/tab line
- **Colorscheme** - Theme configuration
- **Indent Blankline** - Indentation guides
- **Dressing** - Enhanced UI for inputs and selections

### 📝 Editing
- **Comment** - Smart commenting with Ctrl+/
- **Autopairs** - Auto-close brackets and quotes
- **Formatting** - Code formatting
- **Linting** - Code linting and diagnostics

### 🚀 Productivity
- **Which Key** - Keybinding hints and discovery
- **Vim Maximizer** - Toggle split window maximization

## ⌨️ Key Mappings

| Mode | Key | Action |
|------|-----|--------|
| Normal | `<leader>ff` | Find files |
| Normal | `<leader>fs` | Find string in files |
| Normal | `<leader>ee` | Toggle file explorer |
| Normal | `<Ctrl-/>` | Toggle line comment |
| Normal | `<leader>sm` | Maximize/minimize split |
| Normal | `<leader>ca` | Code actions |
| Normal | `<leader>rn` | Rename symbol |
| Normal | `gd` | Go to definition |

## 🛠️ Installation

1. Backup your existing Neovim configuration
2. Clone this repository to your Neovim config directory:
   ```bash
   git clone <repository-url> ~/.config/nvim
   ```
3. Start Neovim - plugins will install automatically via Lazy.nvim

## 📋 Requirements

- Neovim 0.8+
- Git
- A Nerd Font (for icons)
- ripgrep (for Telescope live grep)
- Node.js (for some LSP servers)

## 🎨 Features

- ⚡ Fast startup with lazy loading
- 🔍 Powerful fuzzy finding
- 🎯 LSP support for multiple languages
- 🎨 Beautiful and informative UI
- 📦 Easy plugin management with Lazy.nvim
- ⌨️ Intuitive keybindings
