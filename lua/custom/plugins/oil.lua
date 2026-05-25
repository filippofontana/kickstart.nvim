-- oil.nvim: file navigator through nvim

vim.pack.add { 'https://github.com/stevearc/oil.nvim' }
require('oil').setup {
  columns = {
    'icon',
    -- "permissions",
    -- "size",
    -- "mtime",
  },
  keymaps = {
    ['<C-h>'] = false,
    ['<C-s>'] = false,
    ['<C-l>'] = false,
    ['<M-h>'] = {
      'actions.select',
      opts = { horizontal = true },
      desc = 'Open the entry in a horizontal split',
    },
    ['<M-s>'] = {
      'actions.select',
      opts = { vertical = true },
      desc = 'Open the entry in a vertical split',
    },
    ['<M-l>'] = 'actions.refresh',
  },
  view_options = {
    -- Show files and directories that start with "."
    show_hidden = true,
  },
}

-- Open parent directory in parent window
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
-- Open parent directory in floating window
vim.keymap.set('n', '<space>-', require('oil').toggle_float, { desc = 'Open parent directory in floating window' })
