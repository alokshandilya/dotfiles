-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true

-- general
lvim.colorscheme = "gruvbox-material"
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = { "*.lua", "*.html", "*.css", "*.cpp", "*.js" },
  timeout = 1000,
}

-- #######################################
-- ########### gruvbox-material ##########
-- #######################################
vim.opt.background = "dark"
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_background = 'hard' -- soft, medium(default), hard
vim.g.gruvbox_material_foreground = 'mix'  -- material(default), mix, original
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_transparent_background = 1

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
      end

    },
    {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
        require("nvim-surround").setup({
          -- Configuration here, or leave empty to use defaults
        })
      end
    },

    "sainnhe/gruvbox-material"
  }
}

lvim.autocommands = {
  {
    "BufWritePost", -- see `:h autocmd-events`
    {
      -- this table is passed verbatim as `opts` to `nvim_create_autocmd`
      pattern = { "*.md" }, -- see `:h autocmd-events`
      callback = function()
        -- execute script
        vim.cmd("silent !~/.local/bin/scripts/buildNote %:p")
      end
    }
  },
}

-- If the current system shell or the `shell` option is set to /usr/bin/fish then revert to sh
if os.getenv('SHELL') == "/usr/bin/fish" or vim.opt.shell == "/usr/bin/fish" then
  vim.opt.shell = "/usr/bin/zsh"
else
  -- Else default to the system current shell.
  vim.opt.shell = os.getenv('SHELL')
end
