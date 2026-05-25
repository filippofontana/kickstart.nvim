-- TUI of internal nvim undo tree

vim.pack.add { 'https://github.com/jiaoshijie/undotree' }
require('undotree').setup {}
vim.keymap.set('n', '<leader>u', require('undotree').toggle, { noremap = true, silent = true, desc = 'Toggle [u]ndotree' })

