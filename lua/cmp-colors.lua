-- ~/.config/nvim/lua/cmp-colors.lua
-- Cmp colors — fully solid (no transparency)

local M = {}

function M.apply()
  -- ✨ Popup: fully solid
  vim.api.nvim_set_hl(0, "CmpPmenu",       { bg = "#0a1929", fg = "#D4D4D4" })
  vim.api.nvim_set_hl(0, "CmpPmenuBorder", { fg = "#4FC1FF", bg = "#0a1929" })
  vim.api.nvim_set_hl(0, "PmenuSel",       { bg = "#264F78", fg = "#FFFFFF", bold = true })
  vim.api.nvim_set_hl(0, "CmpDoc",         { bg = "#111111", fg = "#D4D4D4" })
  vim.api.nvim_set_hl(0, "CmpDocBorder",   { fg = "#4FC1FF", bg = "#111111" })

  -- Icon colors
  local colors = {
    Function = "#C586C0", Method = "#C586C0", Constructor = "#C586C0",
    Variable = "#9CDCFE", Field = "#9CDCFE", Property = "#9CDCFE",
    Class = "#4EC9B0", Interface = "#4EC9B0", Struct = "#4EC9B0", Module = "#4EC9B0",
    Keyword = "#569CD6", Snippet = "#DCDCAA", Text = "#D4D4D4",
    Constant = "#4FC1FF", Enum = "#4EC9B0", EnumMember = "#4FC1FF",
    Operator = "#D4D4D4", TypeParameter = "#4EC9B0",
    File = "#D4D4D4", Folder = "#DCDCAA", Value = "#4FC1FF",
    Unit = "#D4D4D4", Event = "#DCDCAA",
  }
  for kind, color in pairs(colors) do
    vim.api.nvim_set_hl(0, "CmpItemKind" .. kind, { fg = color })
  end
  vim.api.nvim_set_hl(0, "CmpItemMenu",           { fg = "#808080", italic = true })
  vim.api.nvim_set_hl(0, "CmpItemAbbr",           { fg = "#D4D4D4" })
  vim.api.nvim_set_hl(0, "CmpItemAbbrMatch",      { fg = "#4FC1FF", bold = true })
  vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#4FC1FF", bold = true })

  -- ✨ Solid editor background (full black)
  vim.api.nvim_set_hl(0, "Normal",       { bg = "#000000" })
  vim.api.nvim_set_hl(0, "NormalNC",     { bg = "#000000" })
  vim.api.nvim_set_hl(0, "SignColumn",   { bg = "#000000" })
  vim.api.nvim_set_hl(0, "LineNr",       { bg = "#000000" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "#000000" })
  vim.api.nvim_set_hl(0, "EndOfBuffer",  { bg = "#000000" })
end

return M
