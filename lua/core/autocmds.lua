-- ============================================
-- AUTOCOMMANDS
-- ============================================

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- General autocmds
local general = augroup("General", { clear = true })

-- Auto-save
autocmd({ "InsertLeave", "TextChanged" }, {
  group = general,
  pattern = "*",
  callback = function()
    if vim.bo.modified and vim.bo.buftype == "" then
      vim.cmd("silent! write!")
    end
  end,
})

-- Resize splits
autocmd("VimResized", {
  group = general,
  pattern = "*",
  command = "tabdo wincmd =",
})

-- Terminal settings
autocmd({ "TermOpen", "BufEnter" }, {
  group = general,
  pattern = "term://*",
  callback = function()
    vim.wo.number = false
    vim.wo.relativenumber = false
    vim.wo.signcolumn = "no"
    vim.wo.foldcolumn = "0"
  end,
})

autocmd("TermOpen", {
  group = general,
  pattern = "*",
  callback = function()
    vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { buffer = true })
    vim.keymap.set("t", "<C-q>", "<C-\\><C-n>:bd!<CR>", { buffer = true })
  end,
})

-- Filetype specific
local filetypes = augroup("Filetypes", { clear = true })

autocmd("FileType", {
  group = filetypes,
  pattern = { "python", "java" },
  callback = function()
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
  end,
})

-- Highlight on yank
autocmd("TextYankPost", {
  group = general,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})
