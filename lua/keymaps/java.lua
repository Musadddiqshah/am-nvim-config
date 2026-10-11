-- ============================================
-- JAVA KEYMAPS
-- ============================================

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local term_count = 0

-- Run Java in new terminal
function RunJavaTerminal()
  if vim.bo.modified then vim.cmd("silent! write!") end
  local filename = vim.fn.expand("%:r")
  term_count = term_count + 1
  vim.cmd("tabnew | terminal javac " .. vim.fn.expand("%") .. " && java " .. filename)
  vim.cmd("file java" .. term_count)
  vim.cmd("startinsert")
  vim.notify(" Running: " .. vim.fn.expand("%:t"), "info", { timeout = 1500 })
end

-- Java mappings




map("n", "<leader>rj", RunJavaTerminal, opts)


map("n", "<leader>cf", function()
  require("conform").format({
    async = false,
    lsp_format = "fallback",
  })
end, {
  buffer = true,
  desc = "Format Java",
})
