return {
  "barrett-ruth/live-server.nvim",
  build = "npm install -g live-server",
  cmd = { "LiveServerStart", "LiveServerStop" },
  config = true,
  keys = {
    {
      "<leader>ls",
      function()
        vim.cmd("w")
        vim.cmd("LiveServerStart")
        vim.defer_fn(function()
          local file = vim.fn.expand("%:t")
          local url = "http://localhost:5500/" .. file
          vim.notify("  Live Server started!\nCtrl+Click → " .. url, vim.log.levels.INFO, { title = "Live Server" })
        end, 1000)
      end,
      desc = "Start Live Server",
    },
    {
      "<leader>lx",
      "<cmd>LiveServerStop<cr>",
      desc = "Stop Live Server",
    },
  },
}
