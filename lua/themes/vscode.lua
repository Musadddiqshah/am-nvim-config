-- ============================================
-- VS CODE DARK THEME
-- ============================================

local function setup_vscode()
  local ok, vscode = pcall(require, "vscode")
  if ok then
    vscode.setup({
      transparent = true,
      italic_comments = true,
      disable_nvimtree_bg = true,
      color_overrides = {
        vscode = {
          background = "#1e1e1e",
          background_light = "#252526",
          background_dark = "#0a0a0a",
          foreground = "#d4d4d4",
          selection = "#264f78",
          comment = "#6a9955",
        },
      },
    })
    vim.cmd.colorscheme("vscode")
    return true
  end
  return false
end

-- Fallback if vscode not installed
if not setup_vscode() then
  vim.cmd.colorscheme("habamax")
end
