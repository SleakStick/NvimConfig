return {
  "lervag/vimtex", -- Plugin repository
  config = function()
    -- Set the LaTeX compiler
--    vim.g.vimtex_compiler_latexmk = {
--      executable = 'latexmk',
--      options = {
--        '-verbose',
--        '-file-line-error',
--        '-synctex=1',
--        '-output-directory=build'
--      },
--    }
    vim.g.vimtex_compiler_method = "latexmk"

    -- Configure PDF viewer (replace with your preferred viewer)
    vim.g.vimtex_view_general_viewer = "zathura"
    vim.g.vimtex_view_general_options = [[-reuse-instance -forward-search @tex @line @pdf]]
    vim.g.vimtex_view_forward_search_on_start = 1 -- Auto-open PDF on compile

    -- Enable conceal (optional, hides some LaTeX syntax for better readability)
    vim.g.tex_conceal = "abdmg"

    -- Keybindings (optional)
    vim.keymap.set("n", "<leader>lc", ":VimtexCompile<CR>", { desc = "Compile LaTeX" })
    vim.keymap.set("n", "<leader>le", ":VimtexCompile<CR>", { desc = "Show vimtex errors"})
    vim.keymap.set("n", "<leader>lv", ":VimtexView<CR>", { desc = "View PDF" })
    vim.keymap.set("n", "<leader>lx", ":VimtexStop<CR>", { desc = "Stop Compilation" })
  end,
}
