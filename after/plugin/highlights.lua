-- ~/.config/nvim/after/plugin/highlights.lua
-- Completion popup + floating window styling (survives theme toggles)

local function apply_hl()
  -- Popup menu (completion list) — matches your dark #0a0a12 / #1e1e1e vibe
  vim.api.nvim_set_hl(0, "Pmenu",       { bg = "#1a1a2e", fg = "#cdd6f4" })
  vim.api.nvim_set_hl(0, "PmenuSel",    { bg = "#45475a", fg = "#f5e0dc", bold = true })
  vim.api.nvim_set_hl(0, "PmenuBorder", { fg = "#89b4fa", bg = "#1a1a2e" })

  -- Floating windows (LSP hover, diagnostics, cmp doc)
  vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#89b4fa", bg = "#1a1a2e" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1a1a2e", fg = "#cdd6f4" })

  -- cmp documentation popup
  vim.api.nvim_set_hl(0, "CmpDocumentation",       { bg = "#1a1a2e", fg = "#cdd6f4" })
  vim.api.nvim_set_hl(0, "CmpDocumentationBorder", { fg = "#89b4fa", bg = "#1a1a2e" })
end

-- Apply immediately
apply_hl()

-- Re-apply whenever the colorscheme changes (theme toggle)
vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("CustomHighlights", { clear = true }),
  callback = apply_hl,
})
