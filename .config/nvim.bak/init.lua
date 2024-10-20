require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

vim.cmd("let g:vimtex_quickfix_mode = 0")
--vim.cmd("let g:vimtex_toc_config = { 'name' : 'TOC', 'layers' : ['content', 'todo', 'include'], 'split_width' : 25, 'todo_sorted' : 0, 'show_help' : 1, 'show_numbers' : 1,}")

-- Mapping for auto-save
-- vim.api.nvim_set_keymap("n", "<leader>as", ":ASToggle<CR>", {})


require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

vim.cmd(":set rnu!")

