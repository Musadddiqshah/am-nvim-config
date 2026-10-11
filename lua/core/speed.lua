-- ============================================
-- SPEED OPTIMIZATIONS
-- ============================================

-- Increase performance
vim.opt.updatetime = 250
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 2000
vim.opt.synmaxcol = 300

-- Disable unused providers
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

-- Fast scrolling
vim.opt.ttyfast = true
vim.opt.lazyredraw = true

-- Faster completion
vim.opt.pumheight = 10
vim.opt.pumwidth = 30
