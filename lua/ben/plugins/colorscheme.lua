return {
  "folke/tokyonight.nvim",
  priority = 1000,
  config = function()
    local transparent = false -- Set to true if you would like to enable transparency

    -- Define gray-based colors
    local bg = "#2E2E2E" -- Dark gray background
    local bg_dark = "#282828" -- Slightly lighter dark gray
    local bg_highlight = "#3E3E3E" -- Highlighted gray background
    local bg_search = "#5E5E5E" -- Search gray background
    local bg_visual = "#4A4A4A" -- Visual mode gray background
    local fg = "#E0E0E0" -- Light gray foreground
    local fg_dark = "#C0C0C0" -- Slightly darker light gray
    local fg_gutter = "#909090" -- Gutter gray foreground
    local border = "#6A6A6A" -- Border gray color

    require("tokyonight").setup({
      style = "night", -- Use "night" style for a balanced theme
      transparent = transparent,
      styles = {
        sidebars = transparent and "transparent" or "dark",
        floats = transparent and "transparent" or "dark",
      },
      on_colors = function(colors)
        colors.bg = bg
        colors.bg_dark = transparent and colors.none or bg_dark
        colors.bg_float = transparent and colors.none or bg_dark
        colors.bg_highlight = bg_highlight
        colors.bg_popup = bg_dark
        colors.bg_search = bg_search
        colors.bg_sidebar = transparent and colors.none or bg_dark
        colors.bg_statusline = transparent and colors.none or bg_dark
        colors.bg_visual = bg_visual
        colors.border = border
        colors.fg = fg
        colors.fg_dark = fg_dark
        colors.fg_float = fg
        colors.fg_gutter = fg_gutter
        colors.fg_sidebar = fg_dark
      end,
    })

    vim.cmd("colorscheme tokyonight")
  end,
}

