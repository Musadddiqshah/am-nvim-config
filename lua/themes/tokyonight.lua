local function setup_tokyonight()
  local ok, tokyonight = pcall(require, "tokyonight")
  if ok then
    tokyonight.setup({
      style = "storm",
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = { bold = true },
      },
    })
    vim.cmd.colorscheme("tokyonight")
    return true
  end
  return false
end

if not setup_tokyonight() then
  vim.cmd.colorscheme("habamax")
end
