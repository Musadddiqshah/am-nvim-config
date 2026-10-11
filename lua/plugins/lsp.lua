return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require("mason").setup()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local function apply_small_handlers()
        vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
          config = vim.tbl_deep_extend("force", config or {}, {
            border = "rounded", max_width = 50, max_height = 15, focusable = false,
          })
          return vim.lsp.handlers.hover(_, result, ctx, config)
        end
        vim.lsp.handlers["textDocument/signatureHelp"] = function(_, result, ctx, config)
          config = vim.tbl_deep_extend("force", config or {}, {
            border = "rounded", max_width = 50, max_height = 8, focusable = false, offset_y = 1,
          })
          return vim.lsp.handlers.signature_help(_, result, ctx, config)
        end
      end

      apply_small_handlers()

      vim.lsp.config("pyright", {
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = { "python" },
        root_markers = { "pyproject.toml", "setup.py", "requirements.txt", ".git" },
        capabilities = capabilities,
      })

      local jdtls_path = vim.fn.exepath("jdtls")
      if jdtls_path == "" then jdtls_path = vim.fn.expand("~/.local/bin/jdtls") end

      if vim.fn.executable(jdtls_path) == 1 then
        vim.lsp.config("jdtls", {
          cmd = {
            jdtls_path, "-configuration", vim.fn.stdpath("data") .. "/jdtls/config",
            "-data", vim.fn.stdpath("data") .. "/jdtls/workspace",
            "-Xms256m", "-Xmx1g",
          },
          filetypes = { "java" },
          root_markers = { ".project", "pom.xml", "build.gradle", ".git" },
          capabilities = capabilities,
        })
      end

      vim.lsp.enable("pyright")
      vim.lsp.enable("jdtls")

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        end,
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      local icons = {
        Text = "󰉿", Method = "󰆧", Function = "󰊕", Constructor = "",
        Field = "󰜢", Variable = "󰀫", Class = "󰠱", Interface = "",
        Module = "", Property = "󰜢", Unit = "󰑭", Value = "󰎠",
        Enum = "", Keyword = "󰌋", Snippet = "", Color = "󰏘",
        File = "󰈙", Reference = "󰈇", Folder = "󰉋",
        EnumMember = "", Constant = "󰏿", Struct = "󰙅",
        Event = "", Operator = "󰆕", TypeParameter = "󰅲",
      }

      cmp.setup({
        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        performance = { max_view_entries = 8 },
        window = {
          completion = cmp.config.window.bordered({
            border = "rounded",
            max_width = 45,
            max_height = 8,
          }),
          documentation = false,
        },
        formatting = {
          fields = { "kind", "abbr" },  -- No menu, no [LSP]
          format = function(entry, vim_item)
            vim_item.kind = icons[vim_item.kind] or ""
            vim_item.abbr = vim.fn.strcharpart(vim_item.abbr, 0, 22)
            return vim_item
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
            else fallback() end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then luasnip.jump(-1)
            else fallback() end
          end, { "i", "s" }),
          ["<Down>"] = cmp.mapping.select_next_item(),
          ["<Up>"] = cmp.mapping.select_prev_item(),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
      })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = "buffer" } },
      })
    end,
  },
}
