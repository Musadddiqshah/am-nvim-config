vim.keymap.set("n", "<leader>cf", function()
  require("conform").format({
    async = false,
    lsp_format = "fallback",
  })
end, {
  buffer = true,
  desc = "Format Python",
})
