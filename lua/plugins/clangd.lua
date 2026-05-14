return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    opts.servers = opts.servers or {}
    opts.servers.clangd = opts.servers.clangd or {}
    opts.servers.clangd.cmd = {
      "clangd",
      "--completion-style=bundled",
      "--header-insertion=iwyu",
      "--pch-storage=memory",
    }
    return opts
  end,
}
