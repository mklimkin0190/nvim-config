-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>h", Snacks.dashboard.open, { desc = "Open dashboard" })
vim.keymap.set("n", "<Left>", ':echo "No arrows!"<CR>')
vim.keymap.set("n", "<Right>", ':echo "No arrows!"<CR>')
vim.keymap.set("n", "<Up>", ':echo "No arrows!"<CR>')
vim.keymap.set("n", "<Down>", ':echo "No arrows!"<CR>')
vim.keymap.set("v", "<Left>", ':<C-u>echo "No arrows!"<CR>')
vim.keymap.set("v", "<Right>", ':<C-u>echo "No arrows!"<CR>')
vim.keymap.set("v", "<Up>", ':<C-u>echo "No arrows!"<CR>')
vim.keymap.set("v", "<Down>", ':<C-u>echo "No arrows!"<CR>')
vim.keymap.set("i", "<Left>", '<C-o>:echo "No arrows!"<CR>')
vim.keymap.set("i", "<Right>", '<C-o>:echo "No arrows!"<CR>')
vim.keymap.set("i", "<Up>", '<C-o>:echo "No arrows!"<CR>')
vim.keymap.set("i", "<Down>", '<C-o>:echo "No arrows!"<CR>')

vim.keymap.set("n", "vgd", ":vsplit | lua vim.lsp.buf.definition()<CR><C-w>H")

vim.keymap.set("n", "<leader>ce", ":lua vim.diagnostic.open_float()<CR>")

vim.g.copilot_no_tab_map = true
vim.keymap.set(
  "i",
  "<C-`>",
  'copilot#Accept("<CR>")',
  { expr = true, silent = true, script = true, replace_keycodes = false }
)

vim.keymap.set("n", "<leader>by", function()
  local filepath = vim.api.nvim_buf_get_name(0)

  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]

  if git_root and filepath:sub(1, #git_root) == git_root then
    local relpath = filepath:sub(#git_root + 2)
    vim.notify("Copied relative path: " .. relpath)
    vim.fn.setreg("+", relpath)
  else
    vim.notify("Not inside a git repository.")
  end
end, { desc = "Copy Relative Path" })

local function add_quickfix_error()
  local input = vim.fn.input
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_line = vim.fn.line(".")
  local filename = input("File path: ", current_file)
  local lnum = tonumber(input("Line number: ", tostring(current_line)))
  local col = tonumber(input("Column (optional): ", "")) or 1
  local text = input("Error message: ")

  if text == "" then
    vim.notify("Error message is required", vim.log.levels.WARN)
    return
  end

  vim.fn.setqflist({
    {
      filename = filename,
      lnum = lnum,
      col = col,
      text = text,
      type = "E",
    },
  }, "a") -- append

  vim.cmd("copen")
  vim.notify("Added error to quickfix list", vim.log.levels.INFO)
end

vim.api.nvim_create_user_command("AddQuickfixError", add_quickfix_error, {})

vim.keymap.set("n", "<leader>xa", add_quickfix_error, { desc = "Add error to quickfix list" })
