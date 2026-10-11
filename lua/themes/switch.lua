-- ============================================
-- THEME SWITCHER - Tokyo Night ↔ VS Code
-- ============================================

local M = {}

-- Track current theme
local current_theme = "tokyonight"

function M.toggle()
  if current_theme == "tokyonight" then
    -- Switch to VS Code
    local ok = pcall(require, "themes.vscode")
    if ok then
      current_theme = "vscode"
      vim.notify(" Theme: VS Code Dark", "info")
    else
      vim.notify(" VS Code theme not available", "warn")
    end
  else
    -- Switch to Tokyo Night
    local ok = pcall(require, "themes.tokyonight")
    if ok then
      current_theme = "tokyonight"
      vim.notify(" Theme: Tokyo Night", "info")
    else
      vim.notify(" Tokyo Night theme not available", "warn")
    end
  end
end

function M.set_tokyonight()
  local ok = pcall(require, "themes.tokyonight")
  if ok then
    current_theme = "tokyonight"
    vim.notify(" Theme: Tokyo Night", "info")
  end
end

function M.set_vscode()
  local ok = pcall(require, "themes.vscode")
  if ok then
    current_theme = "vscode"
    vim.notify(" Theme: VS Code Dark", "info")
  end
end

function M.get_current()
  return current_theme
end

return M
