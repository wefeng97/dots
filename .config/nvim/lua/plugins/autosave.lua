return {
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

}
