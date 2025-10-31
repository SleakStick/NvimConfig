return {
  "benlubas/molten-nvim",

  lazy = false,
  version = "*",

  build = function()
    vim.cmd('UpdateRemotePlugins')
  end,

  config = function()
    vim.g.molten_image_provider = "image.nvim"
    vim.g.molten_output_win_max_height = 20
  end,
}

