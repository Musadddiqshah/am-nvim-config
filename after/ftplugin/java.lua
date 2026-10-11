-- ============================================
-- JAVA SPECIFIC OPTIMIZATIONS
-- ============================================

-- Smaller syntax sync for speed
vim.opt.synmaxcol = 150
vim.opt.foldmethod = "manual"
vim.opt.foldenable = false

-- Faster redraw
vim.opt.lazyredraw = true

-- Reduce LSP update frequency
vim.opt.updatetime = 500

-- Don't highlight everything
vim.opt.syntax = "java"

-- Disable expensive features for Java
vim.b.current_syntax_sync = 100
