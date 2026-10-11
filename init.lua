-- Disable swap files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = false

-- Basic options
vim.o.termguicolors = true
vim.o.background = "dark"

-- ⭐ Load core configs (options, autocmds, etc.)
pcall(require, "core.options")
pcall(require, "core.autocmds")
pcall(require, "core.help")
pcall(require, "core.speed")
pcall(require, "core.dashboard")

-- ⭐ Load keymaps
pcall(require, "keymaps.general")
pcall(require, "keymaps.python")
pcall(require, "keymaps.java")

-- ⭐ Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ⭐ Load plugins from lua/plugin folder

require("lazy").setup({
  { import = "plugins" },
})

----- Tokyo Night Theme Loaded Automaticly

-- ⭐ Auto-load Tokyo Night on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.defer_fn(function()
      local ok = pcall(require, "themes.tokyonight")
      if not ok then
        pcall(vim.cmd.colorscheme, "tokyonight")
      end
    end, 100)
  end,
})
-- Reapply CmpItemKind colors on colorscheme change
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.defer_fn(function()
      vim.api.nvim_set_hl(0, "CmpItemKindFunction",      { fg = "#C586C0" })
      vim.api.nvim_set_hl(0, "CmpItemKindMethod",        { fg = "#C586C0" })
      vim.api.nvim_set_hl(0, "CmpItemKindConstructor",   { fg = "#C586C0" })
      vim.api.nvim_set_hl(0, "CmpItemKindVariable",      { fg = "#9CDCFE" })
      vim.api.nvim_set_hl(0, "CmpItemKindField",         { fg = "#9CDCFE" })
      vim.api.nvim_set_hl(0, "CmpItemKindProperty",      { fg = "#9CDCFE" })
      vim.api.nvim_set_hl(0, "CmpItemKindClass",         { fg = "#4EC9B0" })
      vim.api.nvim_set_hl(0, "CmpItemKindInterface",     { fg = "#4EC9B0" })
      vim.api.nvim_set_hl(0, "CmpItemKindStruct",        { fg = "#4EC9B0" })
      vim.api.nvim_set_hl(0, "CmpItemKindModule",        { fg = "#4EC9B0" })
      vim.api.nvim_set_hl(0, "CmpItemKindKeyword",       { fg = "#569CD6" })
      vim.api.nvim_set_hl(0, "CmpItemKindSnippet",       { fg = "#DCDCAA" })
      vim.api.nvim_set_hl(0, "CmpItemKindText",          { fg = "#D4D4D4" })
      vim.api.nvim_set_hl(0, "CmpItemKindConstant",      { fg = "#4FC1FF" })
      vim.api.nvim_set_hl(0, "CmpItemKindEnum",          { fg = "#4EC9B0" })
      vim.api.nvim_set_hl(0, "CmpItemKindEnumMember",    { fg = "#4FC1FF" })
      vim.api.nvim_set_hl(0, "CmpItemKindOperator",      { fg = "#D4D4D4" })
      vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#4EC9B0" })
      vim.api.nvim_set_hl(0, "CmpItemKindFile",          { fg = "#D4D4D4" })
      vim.api.nvim_set_hl(0, "CmpItemKindFolder",        { fg = "#DCDCAA" })
      vim.api.nvim_set_hl(0, "CmpItemKindValue",         { fg = "#4FC1FF" })
      vim.api.nvim_set_hl(0, "CmpItemKindUnit",          { fg = "#D4D4D4" })
      vim.api.nvim_set_hl(0, "CmpItemKindEvent",         { fg = "#DCDCAA" })
      vim.api.nvim_set_hl(0, "CmpItemMenu",              { fg = "#808080", italic = true })
      vim.api.nvim_set_hl(0, "CmpItemAbbr",              { fg = "#D4D4D4" })
      vim.api.nvim_set_hl(0, "CmpItemAbbrMatch",         { fg = "#4FC1FF", bold = true })
      vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy",    { fg = "#4FC1FF", bold = true })
    end, 100)
  end,
})
-- Force small popups via Neovim defaults
vim.lsp.util.open_floating_preview = (function(orig)
  return function(contents, syntax, opts)
    opts = opts or {}
    opts.max_width = opts.max_width or 50
    opts.max_height = opts.max_height or 15
    opts.border = opts.border or "rounded"
    return orig(contents, syntax, opts)
  end
end)(vim.lsp.util.open_floating_preview)
-- ⭐ Load keymaps
--pcall(require, "keymaps.general")
--pcall(require, "keymaps.python")
--pcall(require, "keymaps.java")

-- Command line transparent background
vim.api.nvim_set_hl(0, "MsgArea", { bg = "NONE" })
vim.api.nvim_set_hl(0, "MsgSeparator", { bg = "NONE" })
vim.api.nvim_set_hl(0, "CommandLine", { bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
vim.api.nvim_set_hl(0, "VertSplit", { bg = "NONE" })
vim.api.nvim_set_hl(0, "WinSeparator", { bg = "NONE" })
