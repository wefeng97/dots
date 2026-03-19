-- Code Tree Support / Syntax Highlighting
return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  -- require('nvim-treesitter').setup {
  -- -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  -- install_dir = vim.fn.stdpath('data') .. '/site'
  -- }
  -- -- https://github.com/nvim-treesitter/nvim-treesitter
  -- 'nvim-treesitter/nvim-treesitter',
  -- lazy = false,
  -- dependencies = {
  --   -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  --   'nvim-treesitter/nvim-treesitter-textobjects',
  -- },
  -- build = ':TSUpdate',
  -- opts = {
  --   highlight = {
  --     enable = true,
  --   },
  --   indent = { enable = true },
  --   auto_install = true, -- automatically install syntax support when entering new file type buffer
  --   ensure_installed = {
  --     'lua',
  --   },
  -- },
  -- config = function (_, opts)
  --   local configs = require("nvim-treesitter.configs")
  --   configs.setup(opts)
  -- end
}

