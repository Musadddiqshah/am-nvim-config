return {
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          python = { "black" },
          java = { "google_java_format" },
          lua = { "stylua" },
          c = { "clang_format" },
          cpp = { "clang_format" },
        },
        formatters = {
          google_java_format = {
            command = vim.fn.expand("~/.local/bin/google-java-format"),
            args = { "--replace", "$FILENAME" },
            stdin = false,
            timeout_ms = 30000,
          },
          clang_format = {
            command = "clang-format",
            args = { "-i", "$FILENAME" },
            stdin = false,
            timeout_ms = 5000,
          },
        },
        format_on_save = {
          timeout_ms = 30000,
          lsp_format = "fallback",
        },
      })
    end,
  },
}
