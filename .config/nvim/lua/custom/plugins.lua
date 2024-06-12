local plugins={
  {
    "dstein64/vim-startuptime",
    -- lazy-load on a command
    cmd = "StartupTime",
    -- init is called during startup. Configuration for vim plugins typically should be set in an init function
    init = function()
      vim.g.startuptime_tries = 1
    end,
  },

  {
    "dbeniamine/cheat.sh-vim",
  },

  {
    "akinsho/org-bullets.nvim",
    ft="org",
    'akinsho/org-bullets.nvim', config = function()
      require('org-bullets').setup()
    end
  },

  {
    "tueda/form.vim",
    ft = "form",
  },

  -- {
  --   "lewis6991/gitsigns.nvim",
  --   config = function()
  --     require('gitsigns').setup {
  --       signs = {
  --         add          = { text = '│' },
  --         change       = { text = '│' },
  --         delete       = { text = '\\' },
  --         topdelete    = { text = '/' },
  --         changedelete = { text = '>' },
  --         untracked    = { text = '┆' },
  --       },
  --       signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  --       numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  --       linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  --       word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  --       watch_gitdir = {
  --         follow_files = true
  --       },
  --       attach_to_untracked = true,
  --       current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  --       current_line_blame_opts = {
  --         virt_text = true,
  --         virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
  --         delay = 1000,
  --         ignore_whitespace = false,
  --       },
  --       current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  --       sign_priority = 6,
  --       update_debounce = 100,
  --       status_formatter = nil, -- Use default
  --       max_file_length = 40000, -- Disable if file is longer than this (in lines)
  --       preview_config = {
  --         -- Options passed to nvim_open_win
  --         border = 'single',
  --         style = 'minimal',
  --         relative = 'cursor',
  --         row = 0,
  --         col = 1
  --       },
  --       yadm = {
  --         enable = false
  --       },
  --     }
  --   end
  -- },

  {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    },
  config = function()
      require('noice').setup({
        lsp = {
            -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
            override = {
              ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
              ["vim.lsp.util.stylize_markdown"] = true,
              ["cmp.entry.get_documentation"] = true,
            },
          },
          -- you can enable a preset for easier configuration
          presets = {
            bottom_search = true, -- use a classic bottom cmdline for search
            command_palette = true, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = false, -- add a border to hover docs and signature help
        },

        views = {
          cmdline_popup = {
            position = {
              row = -8,
              col = "90%",
            },
            size = {
              width = 50,
              height = "auto",
            },
            border = {
              style = "none",
              padding = { 1, 1 },
            },
            filter_options = {},
            win_options = {
              winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
            },
          },
          popupmenu = {
            relative = "editor",
            position = {
              row = -5,
              col = "90%",
            },
            size = {
              width = 50,
              height = 10,
            },
            border = {
              style = "rounded",
              padding = { 0, 1 },
            },
            win_options = {
              -- winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
            },
          },
        },

      })
    end
  },

  {
    'wellle/targets.vim',
  },

  {
    'tpope/vim-repeat',
  },

  {
   	"sar/AutoSave.nvim",
    lazy = false,
    config = function()
      require('autosave').setup(
        {
          enabled = true,
          execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
          events = {"InsertLeave", "TextChanged"},
          conditions = {
              exists = true,
              filename_is_not = {},
              filetype_is_not = {'lua'},
              modifiable = true
          },
          write_all_buffers = false,
          on_off_commands = true,
          clean_command_line_interval = 0,
          debounce_delay = 135
        }
      )

    require("autosave").hook_after_off = function ()
      print("AutoSave is off!")
    end

    require("autosave").hook_after_on = function ()
      print("AutoSave is on!")
    end

    end
  },

  {
    'nvim-orgmode/orgmode',
    ft = {'org'},
    config = function()
      require('orgmode').setup_ts_grammar()

      require('orgmode').setup({
        org_agenda_files = {'~/Documents/Orgs/*','~/Documents/Orgs/*/*'},
        org_default_notes_file = '~/Documents/Orgs/refill.org',
        org_todo_keywords = {'TODO','NEXT','PENDING','|','DONE','DEL'},
        org_archive_location = '~/Documents/Orgs/archive.org',
        org_indent_mode = 'noindent',
      })
    end
  },

  {
    "github/copilot.vim",
    lazy = false,
  },

  {
    "lervag/vimtex",
    lazy = false,
    config = function ()
        vim.g.vimtex_view_general_viewer = 'okular'
--        vim.g.vimtex_compiler_latexmk_engines = { _ = '-xelatex'}
        vim.g.tex_comment_nospell = 1
        vim.g.vimtex_compiler_progname = 'nvr'
        vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
--        vim.g.vimtex_view_general_options_latexmk = '--unique'
    end,
    ft = 'tex'
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end,
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy=false,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
   "williamboman/mason.nvim",
   opts = {
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "prettier",
        "stylua"
      },
    },
  },

  {
    "jackMort/ChatGPT.nvim",
    event="VeryLazy",
    dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
    },
    config = function()
            require("chatgpt").setup({
      })
    end,
  }

}
return plugins
