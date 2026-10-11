return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",

    config = function()
      local wk = require("which-key")

      -- ============================================================
      -- WHICH-KEY SETUP
      -- ============================================================

      wk.setup({
        preset = "modern",

        delay = 300,

        win = {
          border = "rounded",

          padding = { 0, 1 },

          wo = {
            winblend = 20,
            winhighlight =
              "Normal:WhichKeyNormal,FloatBorder:WhichKeyBorder",
          },
        },

        layout = {
          width = {
            min = 15,
            max = 20,
          },

          spacing = 2,
          align = "left",
        },

        icons = {
          breadcrumb = "»",
          separator = "➜",
          group = "+",

          -- Keep this enabled.
          colors = true,
        },

        plugins = {
          marks = true,
          registers = true,

          spelling = {
            enabled = false,
          },

          presets = {
            operators = false,
            motions = false,
            text_objects = false,
            windows = false,
            nav = false,
            z = false,
            g = false,
          },
        },
      })


      -- ============================================================
      -- WHICH-KEY POPUP COLORS
      -- ============================================================

      local function apply_wk_hl()

        -- Popup background
        vim.api.nvim_set_hl(0, "WhichKeyNormal", {
          bg = "#1a1b26",
          blend = 20,
        })

        -- Popup border
        vim.api.nvim_set_hl(0, "WhichKeyBorder", {
          fg = "#7AA2F7",
          bg = "#1a1b26",
          blend = 20,
        })

        -- Popup floating area
        vim.api.nvim_set_hl(0, "WhichKeyFloat", {
          bg = "#1a1b26",
          blend = 20,
        })

        -- Title
        vim.api.nvim_set_hl(0, "WhichKeyTitle", {
          fg = "#7AA2F7",
          bold = true,
        })

        -- Separator
        vim.api.nvim_set_hl(0, "WhichKeySeparator", {
          fg = "#565f89",
        })

        -- Value
        vim.api.nvim_set_hl(0, "WhichKeyValue", {
          fg = "#9CDCFE",
        })

        -- Key letters
        vim.api.nvim_set_hl(0, "WhichKey", {
          fg = "#7AA2F7",
          bold = true,
        })

        -- Groups
        vim.api.nvim_set_hl(0, "WhichKeyGroup", {
          fg = "#BB9AF7",
          bold = true,
        })

        -- Descriptions
        vim.api.nvim_set_hl(0, "WhichKeyDesc", {
          fg = "#D4D4D4",
        })


        -- ==========================================================
        -- ICON COLORS
        -- ONLY fg IS USED
        -- NO bg
        -- ==========================================================

        -- Groups
        vim.api.nvim_set_hl(0, "WhichKeyIconRun", {
          fg = "#9ECE6A",
        })

        vim.api.nvim_set_hl(0, "WhichKeyIconSearch", {
          fg = "#7AA2F7",
        })

        vim.api.nvim_set_hl(0, "WhichKeyIconFiles", {
          fg = "#E0AF68",
        })

        vim.api.nvim_set_hl(0, "WhichKeyIconGit", {
          fg = "#F7768E",
        })

        vim.api.nvim_set_hl(0, "WhichKeyIconDebug", {
          fg = "#BB9AF7",
        })

        vim.api.nvim_set_hl(0, "WhichKeyIconBuffers", {
          fg = "#2AC3DE",
        })

        vim.api.nvim_set_hl(0, "WhichKeyIconTheme", {
          fg = "#FF9E64",
        })

        vim.api.nvim_set_hl(0, "WhichKeyIconHelp", {
          fg = "#73DACA",
        })

        vim.api.nvim_set_hl(0, "WhichKeyIconQuit", {
          fg = "#F7768E",
        })

        vim.api.nvim_set_hl(0, "WhichKeyIconCode", {
          fg = "#7DCFFF",
        })

        vim.api.nvim_set_hl(0, "WhichKeyIconWrite", {
          fg = "#9ECE6A",
        })

        vim.api.nvim_set_hl(0, "WhichKeyIconLSP", {
          fg = "#BB9AF7",
        })

        vim.api.nvim_set_hl(0, "WhichKeyIconNotifications", {
          fg = "#E0AF68",
        })


        -- ==========================================================
        -- LANGUAGE ICON COLORS
        -- ==========================================================

        vim.api.nvim_set_hl(0, "WhichKeyIconPython", {
          fg = "#3572A5",
        })

        vim.api.nvim_set_hl(0, "WhichKeyIconJava", {
          fg = "#B07219",
        })

        vim.api.nvim_set_hl(0, "WhichKeyIconRust", {
          fg = "#DEA584",
        })

        vim.api.nvim_set_hl(0, "WhichKeyIconGo", {
          fg = "#00ADD8",
        })

        vim.api.nvim_set_hl(0, "WhichKeyIconNode", {
          fg = "#F7DF1E",
        })

        vim.api.nvim_set_hl(0, "WhichKeyIconTypeScript", {
          fg = "#3178C6",
        })

        vim.api.nvim_set_hl(0, "WhichKeyIconLua", {
          fg = "#51A0CF",
        })


        -- ==========================================================
        -- ACTION ICON COLORS
        -- ==========================================================

        vim.api.nvim_set_hl(0, "WhichKeyIconFileTree", {
          fg = "#E0AF68",
        })

        vim.api.nvim_set_hl(0, "WhichKeyIconFindFiles", {
          fg = "#7AA2F7",
        })

        vim.api.nvim_set_hl(0, "WhichKeyIconClose", {
          fg = "#F7768E",
        })

        vim.api.nvim_set_hl(0, "WhichKeyIconGitAction", {
          fg = "#F7768E",
        })

        vim.api.nvim_set_hl(0, "WhichKeyIconPalette", {
          fg = "#FF9E64",
        })
      end


      -- Apply immediately
      apply_wk_hl()


      -- Re-apply after colorscheme changes
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          vim.defer_fn(apply_wk_hl, 100)
        end,
      })


      -- ============================================================
      -- WHICH-KEY KEYMAPS
      -- ============================================================

      wk.add({

        -- ==========================================================
        -- GROUPS
        -- ==========================================================

        {
          "<leader>r",
          group = "Run",
          icon = {
            icon = "",
            hl = "WhichKeyIconRun",
          },
        },

        {
          "<leader>s",
          group = "Save",
          icon = {
            icon = "",
            hl = "WhichKeyIconSearch",
          },
        },

        {
          "<leader>f",
          group = "Files",
          icon = {
            icon = "",
            hl = "WhichKeyIconFiles",
          },
        },

        {
          "<leader>g",
          group = "Git",
          icon = {
            icon = "",
            hl = "WhichKeyIconGit",
          },
        },

        {
          "<leader>d",
          group = "Debug",
          icon = {
            icon = "",
            hl = "WhichKeyIconDebug",
          },
        },

        {
          "<leader>b",
          group = "Buffers",
          icon = {
            icon = "",
            hl = "WhichKeyIconBuffers",
          },
        },

        {
          "<leader>t",
          group = "Theme",
          icon = {
            icon = "󰌁",
            hl = "WhichKeyIconTheme",
          },
        },

        {
          "<leader>h",
          group = "Help",
          icon = {
            icon = "󰋖",
            hl = "WhichKeyIconHelp",
          },
        },

        {
          "<leader>q",
          group = "Quit",
          icon = {
            icon = "󰿅",
            hl = "WhichKeyIconQuit",
          },
        },

        {
          "<leader>c",
          group = "Code",
          icon = {
            icon = "",
            hl = "WhichKeyIconCode",
          },
        },

        {
          "<leader>w",
          group = "Write",
          icon = {
            icon = "",
            hl = "WhichKeyIconWrite",
          },
        },

        {
          "<leader>l",
          group = "LSP",
          icon = {
            icon = "",
            hl = "WhichKeyIconLSP",
          },
        },

        {
          "<leader>n",
          group = "Notifications",
          icon = {
            icon = "",
            hl = "WhichKeyIconNotifications",
          },
        },


        -- ==========================================================
        -- FILE TREE
        -- ==========================================================

        {
          "<leader>e",
          desc = "Toggle file tree",
          icon = {
            icon = "",
            hl = "WhichKeyIconFileTree",
          },
        },

        {
          "<leader>E",
          desc = "Focus file tree",
          icon = {
            icon = "",
            hl = "WhichKeyIconFileTree",
          },
        },


        -- ==========================================================
        -- LANGUAGES
        -- ==========================================================

        {
          "<leader>rp",
          desc = "Run Python",
          icon = {
            icon = "󰌠",
            hl = "WhichKeyIconPython",
          },
        },

        {
          "<leader>rj",
          desc = "Run Java",
          icon = {
            icon = "",
            hl = "WhichKeyIconJava",
          },
        },
        {
          "<leader>rc",
          desc = "Run C code",
          icon = {
            icon = "",
            hl = "WhichKeyIconJava",
          },
      },
        {
          "<leader>rg",
          desc = "Run c++ code",
          icon = {
            icon = "",
            hl = "WhichKeyIconJava",
          },
      },

{
  "<leader>rf",
  desc = "Rename file",
  icon = {
    icon = "󰑕",
    hl = "WhichKeyIconWrite",
  },
},

        -- ==========================================================
        -- FILES
        -- ==========================================================

        {
          "<leader>ff",
          desc = "Find files",
          icon = {
            icon = "󰈞",
            hl = "WhichKeyIconFindFiles",
          },
        },

        {
          "<leader>fg",
          desc = "Live grep",
          icon = {
            icon = "",
            hl = "WhichKeyIconSearch",
          },
        },

        {
          "<leader>fb",
          desc = "Buffers",
          icon = {
            icon = "",
            hl = "WhichKeyIconBuffers",
          },
        },

        {
          "<leader>fh",
          desc = "Help tags",
          icon = {
            icon = "󰘥",
            hl = "WhichKeyIconHelp",
          },
        },


        -- ==========================================================
        -- BUFFERS
        -- ==========================================================

        {
          "<leader>bn",
          desc = "Next buffer",
          icon = {
            icon = "󰙢",
            hl = "WhichKeyIconBuffers",
          },
        },

        {
          "<leader>bd",
          desc = "Close buffer",
          icon = {
            icon = "",
            hl = "WhichKeyIconClose",
          },
        },

        {
          "<leader>bp",
          desc = "Pick buffer",
          icon = {
            icon = "",
            hl = "WhichKeyIconBuffers",
          },
        },

        {
          "<leader>bo",
          desc = "Close others",
          icon = {
            icon = "",
            hl = "WhichKeyIconClose",
          },
        },


        -- ==========================================================
        -- THEME
        -- ==========================================================

        {
          "<leader>tn",
          desc = "Tokyo Night",
          icon = {
            icon = "󰖔",
            hl = "WhichKeyIconTheme",
          },
        },

        {
          "<leader>tv",
          desc = "VS Code",
          icon = {
            icon = "",
            hl = "WhichKeyIconTheme",
          },
        },

        {
          "<leader>tt",
          desc = "Toggle theme",
          icon = {
            icon = "",
            hl = "WhichKeyIconPalette",
          },
        },
      })
    end,
  },
}


