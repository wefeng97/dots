-- Navigate nvim and tmux windows/panels with vim bindings
return {
  -- https://github.com/christoomey/vim-tmux-navigator
  'christoomey/vim-tmux-navigator',
  -- Only load this plugin if tmux is being used
  --event = function()
  --  if vim.fn.exists("$TMUX") == 1 then
  event = "VeryLazy",
  --  end
  --end,
  keys = {
    { "<C-h>", "<cmd>TmuxNavigateLeft<CR>", desc = "Navigate to left tmux pane" },
    { "<C-j>", "<cmd>TmuxNavigateDown<CR>", desc = "Navigate to down tmux pane" },
    { "<C-k>", "<cmd>TmuxNavigateUp<CR>", desc = "Navigate to up tmux pane" },
    { "<C-l>", "<cmd>TmuxNavigateRight<CR>", desc = "Navigate to right tmux pane" },
  },
}

