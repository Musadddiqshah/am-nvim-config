-- ============================================
-- PYTHON KEYMAPS
-- ============================================

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local term_count = 0

-- Run Python in new terminal
function RunPythonTerminal()
  if vim.bo.modified then vim.cmd("silent! write!") end
  term_count = term_count + 1
  local filepath = vim.fn.expand("%")
  vim.cmd("tabnew | terminal python3 '" .. filepath .. "'")
  vim.cmd("file python" .. term_count)
  vim.cmd("startinsert")
  vim.notify(" Running: " .. vim.fn.expand("%:t"), "info", { timeout = 1500 })
end

-- Python mappings
map("n", "<leader>rp", RunPythonTerminal, opts)
