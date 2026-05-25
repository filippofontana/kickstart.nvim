-- vim-tmux-navigator: seamless integration between nvim and tmux.

vim.pack.add { 'https://github.com/christoomey/vim-tmux-navigator' }
vim.keymap.set({ 'n', 't' }, '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>', { desc = 'Move to the left split/pane' })
vim.keymap.set({ 'n', 't' }, '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>', { desc = 'Move to the down split/pane' })
vim.keymap.set({ 'n', 't' }, '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>', { desc = 'Move to the upper split/pane' })
vim.keymap.set({ 'n', 't' }, '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>', { desc = 'Move to the right split/pane' })
