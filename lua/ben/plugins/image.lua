return {
  "3rd/image.nvim",
  lazy = false,
  build=false,
  opts = {
    processor = "magick_cli",
  },

  config=function()
    local image=require("image")
    -- if havnig issues, use
    version = "1.1.0"

    image.setup({
      backend = "kitty", 
      clear_in_insert_mode = true,
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = true,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          only_render_image_at_cursor_mode = "popup", 
          floating_windows = false, 
          filetypes = { "markdown", "vimwiki" }, 
        },
        neorg = {
          enabled = true,
          filetypes = { "norg" },
        },
        typst = {
          enabled = true,
          filetypes = { "typst" },
        },
        html = {
          enabled = false,
        },
        css = {
          enabled = false,
        },
      },
      max_width = 100,
      max_height = 25,
      max_width_window_percentage = math.huge,
      max_height_window_percentage = math.huge,
      scale_factor = 1.0,
      window_overlap_clear_enabled = false, 
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
      editor_only_render_when_focused = true, 
      tmux_show_only_in_active_window = true, 
      hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, 
    })
  end
}
