-- ============================================
-- CORE OPTIONS - SPEED OPTIMIZED
-- ============================================

local opt = vim.opt

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.signcolumn = "yes"

-- Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.wrap = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

--  PERFORMANCE (SPEED UP)
opt.updatetime = 250
opt.timeoutlen = 300
opt.redrawtime = 10000
opt.synmaxcol = 200
opt.lazyredraw = false
opt.ttyfast = true

--  BIG FILE PERFORMANCE
vim.cmd([[
  augroup BigFilePerformance
    autocmd!
    autocmd BufReadPre * if getfsize(expand("%")) > 100000 | syntax off | setlocal noswapfile noundofile | endif
  augroup END
]])

-- Files
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- Clipboard
opt.clipboard = "unnamedplus"

-- Mouse
opt.mouse = "a"

-- Split behavior
opt.splitright = true
opt.splitbelow = true

-- Misc
opt.completeopt = "menuone,noinsert,noselect"
opt.cmdheight = 1
opt.showmode = false
opt.hidden = true

-- Disable messages
opt.shortmess = "atI"
opt.showcmd = false

-- Python specific
vim.g.python3_host_prog = vim.fn.exepath("python3")

-- Hide tilde (~) on empty lines
vim.opt.fillchars:append({ eob = " " })

-- Clean look: no tilde, no end-of-buffer chars
vim.opt.fillchars = {
  eob = " ",       -- End of buffer (hides ~)
  fold = " ",      -- Folded lines
  diff = "╱",      -- Diff filler
  msgsep = "‾",    -- Message separator
}
