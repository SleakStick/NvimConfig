vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set("n", "<leader>ch", ":ToggleTerm direction=horizontal dir=./<CR>", {desc = "Toggle terminal as horizontal split"})
keymap.set("n", "<leader>cf", ":ToggleTerm direction=float dir=./<CR>", {desc = "Toggle terminal as floating window"})
keymap.set("n", "<leader>cv", ":ToggleTerm direction=vertical size=90 dir=./<CR>", {desc = "Toggle terminal as vertical spli"})
keymap.set("n", "<leader>ct", ":ToggleTerm direction=tab dir=./<CR>", {desc = "Toggle terminal as new tab"})


local function line_range_to_cell_create()   -- helper function for creation of cells in molten
  local line_input = vim.fn.input("Extend range by N lines: ")
  local line_amount = tonumber(line_input)

  local total_lines = vim.api.nvim_buf_line_count(0)
  local current_line, current_column = unpack(vim.api.nvim_win_get_cursor(0))
  local end_line = line_amount + current_line 

  if not line_amount or line_amount < 0 or end_line > total_lines then
    vim.notify("Invalid or empty input. Command aborted.", vim.log.levels.WARN)
    return
  end

  vim.fn.MoltenDefineCell(current_line, end_line)
end


keymap.set("n", "<leader>mi", ":MoltenInit<CR>" , { desc = "Initiate Molten" })
keymap.set("n", "<leader>mn", line_range_to_cell_create, {desc = "Create Molten cell from current line to +N line"})
keymap.set("n", "<leader>ml", ":MoltenEvaluateLine<CR>" , { desc = "Run line" })
keymap.set("n", "<leader>mc", ":MoltenReevaluateCell<CR>" , { desc = "Run block" })
keymap.set("n", "<leader>md", ":MoltenDelete<CR>" , { desc = "Run block" })
vim.keymap.set("v", "<leader>mv", ":<C-u>MoltenEvaluateVisual<CR>gv",{ desc = "Run visual selection" })


