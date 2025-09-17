-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("BufWinLeave", {
  pattern = "*",
  callback = function(args)
    local bufnr = args.buf
    local bufname = vim.api.nvim_buf_get_name(bufnr)
    if bufname:match("CodeCompanion") or vim.bo[bufnr].filetype == "codecompanion" then
      vim.notify("Saving CodeCompanion conversation to the log file...", vim.log.levels.INFO)
      local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
      if #lines > 0 then
        local log_file = vim.fn.expand("~") .. "/codecompanion_log.md"
        local f = io.open(log_file, "a")
        if f then
          f:write("\n\n--- Conversation on " .. os.date() .. " ---\n")
          for _, line in ipairs(lines) do
            f:write(line .. "\n")
          end
          f:close()
        else
          vim.notify("Cannot open log file: " .. log_file, vim.log.levels.ERROR)
        end
      end
    end
  end,
  desc = "Auto-save CodeCompanion conversation on buffer close",
})
