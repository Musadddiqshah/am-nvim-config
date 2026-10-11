-- ============================================
-- PYTHON SPECIFIC SETTINGS
-- ============================================

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Python keymaps
vim.keymap.set("n", "<leader>r", function()
  if vim.bo.modified then vim.cmd("silent! write!") end
  vim.cmd("!python3 %")
end, { buffer = true })

-- Python debug
vim.keymap.set("n", "<leader>db", function()
  require("dap-python").setup(vim.fn.exepath("python3"))
  require("dap-python").test_method()
end, { buffer = true })
