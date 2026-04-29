return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()

    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count
    local screenkey = require("screenkey")

    local colors = {
      white ="#ffffff",
      blue = "#0066b2",
      darkblue ="#001532",
      darkgray = "#3b3b3b",
      gray = "#4c4c4c",
      lightgray = "#6d6d6d",
      fg = "#ffffff",
      bg = "#1a1a1a",
      inactive_bg = "#1a1a1a",
    }

    local theme = {
      normal = {
        a = { bg = colors.blue, fg = colors.bg},
        b = { bg = colors.darkgray, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
        x = { bg = colors.lightgray, fg = colors.fg },
        y = { bg = colors.blue, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.blue, fg = colors.bg},
        b = { bg = colors.darkgray, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
        x = { bg = colors.lightgray, fg = colors.fg },
        y = { bg = colors.blue, fg = colors.fg },
      },
      visual = {
        a = { bg = colors.blue, fg = colors.bg},
        b = { bg = colors.darkgray, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
        x = { bg = colors.lightgray, fg = colors.fg },
        y = { bg = colors.blue, fg = colors.fg },
      },
      command = {
        a = { bg = colors.blue, fg = colors.bg},
        b = { bg = colors.darkgray, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
        x = { bg = colors.lightgray, fg = colors.fg },
        y = { bg = colors.blue, fg = colors.fg },
      },
      replace = {
        a = { bg = colors.blue, fg = colors.bg},
        b = { bg = colors.darkgray, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
        x = { bg = colors.lightgray, fg = colors.fg },
        y = { bg = colors.blue, fg = colors.fg },
      },
      inactive = {
        a = { bg = colors.blue, fg = colors.bg},
        b = { bg = colors.darkgray, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
        x = { bg = colors.lightgray, fg = colors.fg },
        y = { bg = colors.blue, fg = colors.fg },
      },
    }
    vim.cmd('Screenkey toggle_statusline_component')
    lualine.setup({
      options = {
        icons_enabled = true,
        theme = theme,
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
          refresh_time = 16, -- ~60fps
          events = {
            'WinEnter',
            'BufEnter',
            'BufWritePost',
            'SessionLoadPost',
            'FileChangedShellPost',
            'VimResized',
            'Filetype',
            'CursorMoved',
            'CursorMovedI',
            'ModeChanged',
          },
        }
      },
      sections = {
        lualine_a = {
          {
            color = { fg = colors.blue, bg= "none"},
            padding = { left = 0, right = 0 },
            function() return "" end,
          },
          {color = { fg = colors.white , bg= colors.blue},'mode'},
          },
        lualine_b = {'filename'},
        lualine_c = {},
        lualine_x = {
          --{
            --lazy_status.updates,
            --cond = lazy_status.has_updates,
           -- color = { fg = "#6d6d6d" },
          --},
          {
            color = { fg = colors.lightgray, bg= "none"},
            padding = { left = 0, right = 0 },
            function() return "" end,
          },
          {
            color = { fg = colors.lightgray, bg= colors.lightgray},
            padding = { left = 0, right = 0 },
            function() return " " end,
          },
          {
            function()
              return screenkey.get_keys()
            end,
          },

        },
        lualine_y = {
          { "fileformat" },
          { "filetype" },
        },
        lualine_z = {
          { color = { fg = colors.white , bg= colors.darkblue}, 'location' },
          {
            color = { fg = colors.darkblue, bg= "none"},
            padding = { left = 0, right = 0 },
            function() return "" end,
          },
        },
        
     },
    })
  end,
}
