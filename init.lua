require("ben.core")
require("ben.lazy")
vim.opt.lazyredraw = true
vim.opt.synmaxcol = 300
vim.g.vimtex_syntax_conceal_disable = 1
vim.g.vimtex_syntax_enabled = 1
vim.opt.termguicolors = true
local hl = vim.api.nvim_set_hl
local hl = vim.api.nvim_set_hl
hl(0, "MsgArea", { fg = "#ffffff", bg = "none" }) 
hl(0, "NormalFloat", { fg = "#ffffff" }) 
hl(0, "ErrorMsg", { fg = "#b84e53", bold = true })
hl(0, "MoreMsg", { fg = "#ffffff" })
hl(0, "ModeMsg", { fg = "#ffffff" })
--hl(0, "@function", { fg = "#a1cbdf", italic = true })
hl(0, "@variable", { fg = "#ffffff" })
--hl(0, "@keyword", { fg = "#663380", bold = true })
--hl(0, "@string", { fg = "#66ff99" })
hl(0, "@comment", { fg = "#6d6d6d", italic = true })
--hl(0, "@constant", { fg = "#9e112d" })
--hl(0, "@number", { fg = "#cc6600" })
local tex_group = vim.api.nvim_create_augroup("VimTeXConfig", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = tex_group,
    pattern = "tex",
    callback = function()
        vim.cmd("VimtexCompile")
    end,
})
vim.opt.lazyredraw = true
-- this is firenvim specific
if vim.g.started_by_firenvim == true then
  vim.o.laststatus = 0
  vim.o.showtabline = 0
  vim.o.guifont = "monospace:h22" 
  vim.opt.shortmess:append("I")
  vim.g.vimtex_log_verbose = 0
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
    pattern = "www.overleaf.com_*.txt",
    command = "set filetype=tex"
})
vim.api.nvim_create_autocmd({'BufEnter'}, {
    pattern = "expert.ethz.ch_*.txt",
    command = "set filetype=py"
})


