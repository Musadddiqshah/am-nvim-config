-- ~/.config/nvim/lua/plugins/bufferline.lua

return {
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          numbers = "none",
          diagnostics = false,
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = false,
          separator_style = { "", "" },   -- ⭐ arrow separators
          always_show_bufferline = true,
          indicator = { style = "underline" },
          modified_icon = "●",
          max_name_length = 15,
          tab_size = 8,
          color_icons = true,
          buffer_close_icon = "",
          close_icon = "",
        },
        highlights = {
          fill = { bg = "NONE" },
          background = { fg = "#545c7e", bg = "NONE", blend = 30 },
          buffer_selected = { fg = "#7AA2F7", bg = "NONE", bold = true, blend = 30 },
          buffer_visible = { fg = "#565f89", bg = "NONE", blend = 30 },
          separator = { fg = "#3b4261", bg = "NONE", blend = 30 },
          separator_visible = { fg = "#3b4261", bg = "NONE", blend = 30 },
          separator_selected = { fg = "#4FC1FF", bg = "NONE", blend = 30 },
          indicator_selected = { fg = "#4FC1FF", bg = "NONE", blend = 30 },
          modified = { fg = "#E0AF68", bg = "NONE", blend = 30 },
          modified_selected = { fg = "#E0AF68", bg = "NONE", blend = 30 },
          close_button = { fg = "#545c7e", bg = "NONE", blend = 30 },
          close_button_visible = { fg = "#565f89", bg = "NONE", blend = 30 },
          close_button_selected = { fg = "#F7768E", bg = "NONE", blend = 30 },
        },
      })
    end,
  },
}
