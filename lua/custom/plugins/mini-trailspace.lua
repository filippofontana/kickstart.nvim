-- plugin available inside the mini.nvim suite for displaying and
-- trimming whitespaces.
-- NOTE: placed here to avoid conflicts in the main init.lua file
-- managed by kickstart.nvim!

require('mini.trailspace').setup()

vim.keymap.set('n', '<leader>w', '<CMD>lua MiniTrailspace.trim()<CR>', { desc = 'trim [w]hitespaces' })
