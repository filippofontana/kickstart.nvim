-- Custom command to copy the relative path of the file stored in the
-- current buffer
vim.api.nvim_create_user_command('CopyRelPath', function()
  local path = vim.fn.expand '%:p'
  vim.fn.setreg('+', path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})
