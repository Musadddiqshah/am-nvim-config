return {
  {
    "folke/noice.nvim",
    enabled = true,
    lazy = true,
    event = "VeryLazy",
    priority = 100,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        cmdline = {
          enabled = true,
          view = "cmdline_popup",
          format = {
            cmdline = { pattern = "^:", icon = "", lang = "vim" },
          },
        },
        messages = { enabled = false },
        popupmenu = { enabled = false },
        notify = { enabled = false },
        lsp = {
          progress = { enabled = false },
          hover = { enabled = false },
          signature = { enabled = false },
        },
        views = {
          cmdline_popup = {
            position = { row = 2, col = "50%" },
            size = { width = 30, height = "auto" },
            border = { style = "rounded", padding = { 0, 2 } },
          },
        },
      })
    end,
  },
}
