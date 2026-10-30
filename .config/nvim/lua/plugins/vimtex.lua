return {
  {
    "lervag/vimtex",
    lazy = false,
    config = function ()
      -- vim.g.vimtex_view_method = 'okular'
      vim.g.vimtex_view_general_viewer = 'okular'
      vim.g.vimtex_compiler_latexmk_engines = { _ = '-lualatex -synctex=1'}
      -- vim.g.tex_flavor = 'latex'
      -- vim.g.tex_comment_nospell = 1
      -- vim.g.vimtex_compiler_progname = '/home/wefeng/.local/bin/nvr'
      vim.g.vimtex_view_general_options = '--unique file:@pdf\\#src:@line@tex'
      -- vim.g.vimtex_view_general_options_latexmk = '--unique'
    end,
    ft = 'tex'
  },

}
