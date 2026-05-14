return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      menu = {
        border = "single",
      },
      documentation = {
        window = {
          border = "single",
        },
      },
    },
    signature = {
      window = {
        border = "single",
      },
    },
    snippets = {
      preset = "luasnip",
    },
    sources = {
      default = { "snippets", "lsp", "path", "buffer" },
    },
  },
}
