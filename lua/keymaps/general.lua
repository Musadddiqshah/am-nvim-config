-- ============================================
-- GENERAL KEYMAPS
-- ============================================

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-\\>", "<C-w><C-w>", opts)

-- Move lines
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Better indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Save & Quit
map("n", "<leader>w", ":w!<CR>", opts)
map("n", "<leader>s", ":w!<CR>", opts)
map("n", "<C-s>", ":w!<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)
map("n", "<leader>qq", ":q!<CR>", opts)
map("n", "<leader>wq", ":wq<CR>", opts)
map("n", "<leader>x", ":x<CR>", opts)

-- Buffer navigation
map("n", "<leader>bn", ":bnext<CR>", opts)
map("n", "<leader>bp", ":bprevious<CR>", opts)
map("n", "<leader>bd", ":bdelete<CR>", opts)

-- Quickfix
map("n", "<leader>cn", ":cnext<CR>", opts)
map("n", "<leader>cp", ":cprevious<CR>", opts)
map("n", "<leader>co", ":copen<CR>", opts)

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fb", ":Telescope buffers<CR>", opts)
map("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
map("n", "<leader>fs", ":Telescope grep_string<CR>", opts)

-- File explorer
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>E", ":NvimTreeFocus<CR>", opts)

-- Terminal
map("n", "<leader>tt", function()
  vim.cmd("new | terminal")
  vim.cmd("startinsert")
end, opts)

-- Toggle settings
map("n", "<leader>nu", ":set relativenumber!<CR>", opts)
map("n", "<leader>hl", ":set hlsearch!<CR>", opts)
map("n", "<leader>wf", ":set wrap!<CR>", opts)

-- LSP keymaps
map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "K", vim.lsp.buf.hover, opts)
map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
map("n", "gr", vim.lsp.buf.references, opts)
map("n", "[d", vim.diagnostic.goto_prev, opts)
map("n", "]d", vim.diagnostic.goto_next, opts)
map("n", "<leader>ld", vim.diagnostic.open_float, opts)

-- ============================================
-- 📁 FILE OPERATIONS
-- ============================================

map("n", "<leader>nf", function()
  local filename = vim.fn.input("📁 New file name: ")
  if filename ~= "" then
    local filepath = vim.fn.expand("%:p:h") .. "/" .. filename
    vim.cmd("edit " .. filepath)
    vim.cmd("write")
    vim.notify("✅ Created: " .. filename, "info", { timeout = 2000 })
  end
end, opts)

map("n", "<leader>rf", function()
  local oldpath = vim.fn.expand("%:p")
  local oldname = vim.fn.expand("%:t")
  if oldname == "" or vim.bo.buftype == "nofile" then
    vim.notify("⚠️ No file to rename", "warn", { timeout = 2000 })
    return
  end
  local newname = vim.fn.input("📝 Rename '" .. oldname .. "' to: ", oldname)
  if newname ~= "" and newname ~= oldname then
    local newpath = vim.fn.expand("%:p:h") .. "/" .. newname
    if vim.fn.filereadable(newpath) == 1 then
      vim.notify("⚠️ File exists: " .. newname, "error", { timeout = 2000 })
      return
    end
    local success = os.rename(oldpath, newpath)
    if success then
      vim.cmd("bd!")
      vim.cmd("edit " .. newpath)
      vim.notify("✅ Renamed to: " .. newname, "info", { timeout = 2000 })
    end
  end
end, opts)

map("n", "<leader>df", function()
  local filename = vim.fn.expand("%:t")
  if filename == "" or vim.bo.buftype == "nofile" then
    vim.notify("⚠️ No file to delete", "warn", { timeout = 2000 })
    return
  end
  local choice = vim.fn.confirm("🗑️ Delete '" .. filename .. "'?", "&Yes\n&No", 2)
  if choice == 1 then
    local filepath = vim.fn.expand("%:p")
    os.remove(filepath)
    vim.cmd("bd!")
    vim.notify("🗑️ Deleted: " .. filename, "info", { timeout = 2000 })
  end
end, opts)

map("n", "<leader>cp", function()
  local oldname = vim.fn.expand("%:t")
  if oldname == "" or vim.bo.buftype == "nofile" then
    vim.notify("⚠️ No file to copy", "warn", { timeout = 2000 })
    return
  end
  local newname = vim.fn.input("📋 Copy '" .. oldname .. "' as: ", "copy_" .. oldname)
  if newname ~= "" then
    local newpath = vim.fn.expand("%:p:h") .. "/" .. newname
    local content = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local file = io.open(newpath, "w")
    if file then
      file:write(table.concat(content, "\n"))
      file:close()
      vim.notify("✅ Copied to: " .. newname, "info", { timeout = 2000 })
    end
  end
end, opts)

-- ============================================
-- 🎨 PURE BLACK BACKGROUND TOGGLE
-- ============================================

local pure_black = false

map("n", "<leader>hd", function()
  pure_black = not pure_black
  
  if pure_black then
    vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#0a0a0a" })
    vim.api.nvim_set_hl(0, "Folded", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "TabLine", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "TabLineFill", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "WinSeparator", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "VertSplit", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "Pmenu", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#1a1a1a" })
    vim.notify("⬛ Pure Black Background: ON", "info", { timeout = 1500 })
  else
    local current_theme = vim.g.colors_name or "tokyonight"
    vim.cmd.colorscheme(current_theme)
    vim.notify("🎨 Theme restored: " .. current_theme, "info", { timeout = 1500 })
  end
end, opts)

-- ============================================
-- 🎨 THEME SWITCHER
-- ============================================

local function apply_vscode_linenumbers()
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#858585", bg = nil })
  vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#6a6a6a", bg = nil })
  vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#6a6a6a", bg = nil })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FFD700", bold = true, bg = nil })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2a2a2a" })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = nil })
end

local function set_tokyonight()
  pcall(vim.cmd.colorscheme, "tokyonight")
  pure_black = false
  vim.notify("🎨 Theme: Tokyo Night", "info", { timeout = 1500 })
end

local function set_vscode()
  pcall(vim.cmd.colorscheme, "vscode")
  apply_vscode_linenumbers()
  pure_black = false
  vim.notify("🎨 Theme: VS Code Dark", "info", { timeout = 1500 })
end

local function toggle_theme()
  local current = vim.g.colors_name or "tokyonight"
  if current == "tokyonight" or current == "tokyonight-storm" then
    set_vscode()
  else
    set_tokyonight()
  end
end

map("n", "<leader>tn", set_tokyonight, opts)
map("n", "<leader>tv", set_vscode, opts)
map("n", "<leader>ty", toggle_theme, opts)

-- Auto-apply VS Code line numbers when theme loads
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "vscode",
  callback = function()
    apply_vscode_linenumbers()
  end,
})

-- ============================================
-- 📖 HELP KEYMAPS
-- ============================================

map("n", "<leader>hm", function()
  require("core.help").open()
end, opts)

map("n", "<leader>hk", function()
  print("═══════════════════════════════════════════════════════")
  print("  🔥 NEOVIM QUICK REFERENCE")
  print("═══════════════════════════════════════════════════════")
  print("  🐍 Python:    <leader>rp")
  print("  ☕ Java:      <leader>rj")
  print("  📁 Files:     <leader>nf (new) | <leader>rf (rename)")
  print("  🔍 Search:    <leader>ff | <leader>fg")
  print("  🎨 Themes:    <leader>tn (Tokyo) | <leader>tv (VS Code)")
  print("  ⬛ Pure Black: <leader>hd  (toggle background only)")
  print("  📖 Help:      <leader>hm")
  print("═══════════════════════════════════════════════════════")
end, opts)
