local lspconfig = require("lspconfig")
local util = lspconfig.util

lspconfig.eslint.setup({
  -- cmd = { "node", util.root_pattern("package.json")() .. "/node_modules/.bin/vscode-eslint-language-server", "--stdio" },
  -- root_dir = util.root_pattern("package.json", ".eslintrc.js", ".eslintrc.json", ".eslintrc.cjs"),
  cmd = { "vscode-eslint-language-server", "--stdio" },
  root_dir = util.root_pattern("eslint.config.js", "package.json", ".git"),
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  settings = {
    format = { enable = true },
    workingDirectory = { mode = "auto" },
  },
})
