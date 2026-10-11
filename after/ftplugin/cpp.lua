-- C++ settings
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.expandtab = true
vim.opt_local.softtabstop = 4
vim.opt_local.synmaxcol = 200
vim.opt_local.wrap = false
vim.opt_local.foldenable = false

pcall(vim.treesitter.start, 0, "cpp")

-- Run C++
vim.keymap.set("n", "<leader>rg", function()
  if vim.bo.modified then vim.cmd("silent! write!") end
  local name = vim.fn.expand("%:r")
  local path = vim.fn.expand("%:p")
  local dir = vim.fn.expand("%:p:h")
  vim.cmd("tabnew | terminal bash -c 'cd " .. dir .. " && clang++ " .. path .. " -o " .. name .. " && ./" .. name .. "; echo; echo Press Enter; read'")
  vim.cmd("startinsert")
  vim.notify("C++ Running: " .. vim.fn.expand("%:t"), "info", { timeout = 1500 })
end, { buffer = true })

-- Compile only
vim.keymap.set("n", "<leader>cg", function()
  if vim.bo.modified then vim.cmd("silent! write!") end
  vim.cmd("!clang++ " .. vim.fn.expand("%") .. " -o " .. vim.fn.expand("%:r"))
  vim.notify("C++ Compiled", "info", { timeout = 1500 })
end, { buffer = true })

-- Format
vim.keymap.set("n", "<leader>cf", function()
  vim.cmd("!clang-format -i " .. vim.fn.expand("%"))
  vim.cmd("edit!")
end, { buffer = true })
