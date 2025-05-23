-- Custom way to update default commentstrings for C/C++
-- A more complete and polish version is available here:
-- https://github.com/folke/ts-comments.nvim
-- As of now, it should be sufficient this lightweight version.
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'c', 'cpp' },
  callback = function()
    vim.bo.commentstring = '// %s'
  end,
})
