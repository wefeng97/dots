return {
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
}
