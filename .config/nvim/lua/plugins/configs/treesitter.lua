local options = {
  ensure_installed = { "lua" },
  -- vim.opt.runtimepath:append("~/GitRepo/tree-sitter-fixed-form-fortran"),
  -- parser_install_dir = "~/GitRepo/tree-sitter-fixed-form-fortran/",

  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = {'org'},
  },
  -- Enable Treesitter Playground
  playground = { enable = true },
  indent = { enable = true },
}

return options
