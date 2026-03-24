require("ben.core")
require("ben.lazy")
-- this is firenvim specific
if vim.g.started_by_firenvim == true then
  vim.o.laststatus = 0
  vim.o.showtabline = 0
  vim.o.guifont = "monospace:h22" 
end
vim.api.nvim_create_autocmd({'BufEnter'}, {
    pattern = "texnique.xyz_*.txt",
    command = "set filetype=tex"
})
vim.api.nvim_create_autocmd({'BufEnter'}, {
    pattern = "gemini.google.com_*.txt",
    command = "set filetype=tex"
})
vim.api.nvim_create_autocmd({'BufEnter'}, {
    pattern = "overleaf.com_*.txt",
    command = "set filetype=tex"
})


