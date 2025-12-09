return {
  "benlubas/molten-nvim",

  lazy = false,
  version = "*",

  build = function()
    vim.cmd('UpdateRemotePlugins')
  end,

  config = function()
    vim.g.molten_image_provider = "image.nvim"
    vim.g.molten_auto_image_popup = false
    vim.g.molten_auto_open_output = false
    vim.g.molten_output_win_max_height = 20
  end,
}

