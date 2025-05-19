return {
  -- See https://github.com/kiyoon/jupynium.nvim for original config
  "kiyoon/jupynium.nvim",
  build = "pip3 install --user .",
    -- build = "uv pip install . --python=$HOME/.virtualenvs/jupynium/bin/python",
    -- build = "conda run --no-capture-output -n jupynium pip install .",
  "rcarriga/nvim-notify",   -- optional
  "stevearc/dressing.nvim", -- optional, UI for :JupyniumKernelSelect
  config = function()
  require("jupynium").setup({
    python_host = vim.g.python3_host_prog or "python3",

    default_notebook_URL = "localhost:8888/nbclassic",
    jupyter_command = "jupyter",
    notebook_dir = nil,
    firefox_profiles_ini_path = nil,
    firefox_profile_name = nil,
    auto_start_server = {
      enable = false,
      file_pattern = { "*.ju.*" },
    },
    auto_attach_to_server = {
      enable = true,
      file_pattern = { "*.ju.*", "*.md" },
    },
    auto_start_sync = {
      enable = false,
      file_pattern = { "*.ju.*", "*.md" },
    },
    auto_download_ipynb = true,
    auto_close_tab = true,
    autoscroll = {
      enable = true,
      mode = "always", -- "always" or "invisible"
      cell = {
        top_margin_percent = 20,
      },
    },
    scroll = {
      page = { step = 0.5 },
      cell = {
        top_margin_percent = 20,
      },
    },
    jupynium_file_pattern = { "*.ju.*" },
    use_default_keybindings = true,
    textobjects = {
      use_default_keybindings = true,
    },
    syntax_highlight = {
      enable = true,
    },
    shortsighted = false,
    kernel_hover = {
      floating_win_opts = {
        max_width = 84,
        border = "none",
      },
    },
    notify = {
      ignore = {
        -- "download_ipynb",
        -- "error_download_ipynb",
        -- "attach_and_init",
        -- "error_close_main_page",
        -- "notebook_closed",
      },
    },
  })
  end,
}
