return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = function()
      vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { fg = "#4FC1FF", bg = "NONE" })

      require("nvim-tree").setup({
        view = { width = 30, side = "left" },
        renderer = {
          highlight_git = true,
          indent_markers = { enable = true },
          icons = {
            show = { file = true, folder = true, folder_arrow = true, git = true },
          },
        },
        filters = {
          dotfiles = false,
          custom = { "^.git$", "^.DS_Store$", "node_modules", "__pycache__" },
        },
        git = { enable = true, ignore = false },
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "NvimTree",
        callback = function()
          vim.wo.scrollbind = false
          vim.wo.cursorbind = false
          vim.wo.wrap = false
          vim.wo.number = false
          vim.wo.relativenumber = false
          vim.wo.signcolumn = "no"
          vim.wo.foldcolumn = "0"
          vim.wo.cursorline = true
          vim.wo.winfixwidth = true
        end,
      })
    end,
  },
}
