-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- transparency
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })

-- window splits → soft purple
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#7700ff" })
vim.api.nvim_set_hl(0, "VertSplit", { fg = "#7700ff" })

-- LSP hover/docs popup → cyan
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#00ffff", bg = "none" })
vim.api.nvim_set_hl(0, "LspInfoBorder", { fg = "#00ffff", bg = "none" })

-- autocomplete menu → pink/magenta
vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = "#ff00ff", bg = "none" })
vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = "none" })
vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = "none" })

-- autocomplete docs → soft teal
vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = "#00ffaa", bg = "none" })

-- signature help → orange
vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpBorder", { fg = "#ff6600", bg = "none" })

-- diagnostics
vim.api.nvim_set_hl(0, "DiagnosticFloatingError", { bg = "none" })
vim.api.nvim_set_hl(0, "DiagnosticFloatingWarn", { bg = "none" })

-- LspInfoBorder
vim.lsp.handlers["textDocument/hover"] = nil
vim.lsp.handlers["textDocument/signatureHelp"] = nil

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client then
      vim.lsp.handlers["textDocument/hover"] = nil
    end
  end,
})

vim.opt.clipboard = "unnamedplus"
--[[vim.keymap.set("n", "<F5>", function()
  vim.cmd("w")
  local file = vim.fn.expand("%:p")
  local fname = vim.fn.expand("%:t")
  local fnameNoExt = vim.fn.expand("%:t:r")
  local dir = vim.fn.expand("%:p:h")
  local ft = vim.bo.filetype

  local cmd
  if ft == "c" then
    cmd = "gcc " .. file .. " -o /tmp/out && /tmp/out"
  elseif ft == "cpp" then
    cmd = "g++ " .. file .. " -o /tmp/out && /tmp/out"
  elseif ft == "java" then
    cmd = "cd " .. dir .. " && javac " .. fname .. " && java " .. fnameNoExt
  elseif ft == "javascript" then
    cmd = "node " .. file
  elseif ft == "python" then
    cmd = "python3 " .. file
  else
    print("No runner configured for filetype: " .. ft)
    return
  end

  vim.cmd("TermExec cmd='" .. cmd .. "'")
end, { desc = "Save and run file" })]]

vim.keymap.set("n", "<F5>", function()
  vim.cmd("noautocmd w")
  local file = vim.fn.expand("%:p")
  local fname = vim.fn.expand("%:t")
  local fnameNoExt = vim.fn.expand("%:t:r")
  local dir = vim.fn.expand("%:p:h")
  local ft = vim.bo.filetype
  local cmd
  if ft == "c" then
    cmd = "gcc " .. file .. " -o /tmp/out && /tmp/out"
  elseif ft == "cpp" then
    cmd = "g++ " .. file .. " -o /tmp/out && /tmp/out"
  elseif ft == "java" then
    cmd = "cd " .. dir .. " && javac " .. fname .. " && java " .. fnameNoExt
  elseif ft == "javascript" then
    cmd = "node " .. file
  elseif ft == "python" then
    cmd = "python3 " .. file
  else
    print("No runner configured for filetype: " .. ft)
    return
  end
  --require("toggleterm").exec(cmd, 12)
  vim.cmd(string.format("TermExec cmd=%q go_back=0", cmd))
  -- vim.cmd("TermExec cmd='" .. cmd .. "' go_back=0")
  vim.defer_fn(function()
    vim.cmd("startinsert")
  end, 500)
end, { desc = "Save and run file" })
