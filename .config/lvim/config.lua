-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true

lvim.log.level = "info"
lvim.format_on_save = {
	enabled = true,
	pattern = { "*.lua", "*.html", "*.css", "*.cpp", "*.js" },
	timeout = 1000,
}

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.insert_mode["jk"] = "<ESC>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<S-q>"] = ":BufferKill<CR>"
lvim.keys.visual_mode["lf"] = ":lua vim.lsp.buf.range_formatting()<CR>"
lvim.keys.normal_mode["<C-c>"] = ":ColorizerToggle<CR>"

lvim.builtin.which_key.mappings["a"] = { "<cmd>lua require('lspimport').import()<CR>", "LSP Import" }
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.treesitter.auto_install = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"cpp",
	"html",
	"css",
	"javascript",
	"json",
	"lua",
	"python",
	"typescript",
	"tsx",
	"rust",
	"java",
	"yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- -- Additional Plugins <https://www.lunarvim.org/docs/configuration/plugins/user-plugins>
lvim.plugins = {
	{
		"github/copilot.vim",
		"stevanmilic/nvim-lspimport",
		{
			"iamcco/markdown-preview.nvim",
			cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
			build = "cd app && yarn install",
			init = function()
				vim.g.mkdp_filetypes = { "markdown" }
			end,
			ft = { "markdown" },
		},
		"folke/trouble.nvim",
		"dhruvasagar/vim-open-url",
		cmd = "TroubleToggle",
		"mattn/emmet-vim",
		"norcalli/nvim-colorizer.lua",
		{
			"ellisonleao/glow.nvim",
			config = function()
				require("glow").setup()
			end,
		},
		{
			"kylechui/nvim-surround",
			version = "*", -- Use for stability; omit to use `main` branch for the latest features
			event = "VeryLazy",
			config = function()
				require("nvim-surround").setup({
					-- Configuration here, or leave empty to use defaults
				})
			end,
		},
		"ellisonleao/gruvbox.nvim",
		"AckslD/swenv.nvim",
		"stevearc/dressing.nvim",
	},
}

-- gruvbox ellisonleao/gruvbox.nvim
require("gruvbox").setup({
	terminal_colors = true,
	background = dark,
	undercurl = true,
	underline = true,
	bold = true,
	italic = {
		strings = true,
		emphasis = true,
		comments = true,
		operators = false,
		folds = true,
	},
	strikethrough = true,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	inverse = true, -- invert background for search, diffs, statuslines and errors
	contrast = "hard", -- can be "hard", "soft" or empty string
	palette_overrides = {},
	overrides = {},
	dim_inactive = false,
	transparent_mode = false,
})
lvim.colorscheme = "gruvbox"

-- block : python
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({ { name = "black" } })

local linters = require("lvim.lsp.null-ls.linters")
linters.setup({ { command = "flake8", args = { "--ignore=E203" }, filetypes = { "python" } } })

require("lvim.lsp.manager").setup("pyright", opts)
-- endblock : python

-- block : lua
local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
	},
})

require("lvim.lsp.null-ls.formatters").setup({
	{ command = "stylua", filetypes = { "lua" } },
})

require("swenv").setup({
	post_set_venv = function()
		vim.cmd("LspRestart")
	end,
})
-- endblock : lua

-- block : html
require("lvim.lsp.manager").setup("html", opts)

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.prettier.with({
			filetypes = { "html", "css", "javascript", "json" },
		}),
	},
})
-- endblock : html

local lspconfig = require("lspconfig")

lspconfig.emmet_ls.setup({
	cmd = { "emmet-ls", "--stdio" },
	filetypes = { "html", "css", "django-html" },
	root_dir = function(fname)
		return lspconfig.util.find_git_ancestor(fname) or lspconfig.util.path.dirname(fname)
	end,
	settings = {
		emmet = {
			showExpandedAbbreviation = "always",
			showAbbreviationSuggestions = true,
			showSuggestionsAsSnippets = true,
		},
	},
})

vim.filetype.add({
	extension = {
		["html"] = "django-html",
	},
})

local lspconfig = require("lspconfig")

vim.g.user_emmet_leader_key = "<C-Z>"
vim.cmd([[
  autocmd FileType html,css,django-html EmmetInstall
]])

-- lvim.autocommands = {
--   {
--     "BufWritePost", -- see `:h autocmd-events`
--     {
--       -- this table is passed verbatim as `opts` to `nvim_create_autocmd`
--       pattern = { "*.md" }, -- see `:h autocmd-events`
--       callback = function()
--         -- execute script
--         vim.cmd("silent !~/.local/bin/scripts/buildNote %:p")
--       end
--     }
