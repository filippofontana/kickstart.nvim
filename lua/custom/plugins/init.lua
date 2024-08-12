-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  {
    'ThePrimeagen/harpoon',
    event = 'VimEnter',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup()

      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end, { desc = 'Append buffer to Harpoon list' })
      vim.keymap.set('n', '<leader>q', function()
        harpoon:list():remove()
      end, { desc = 'Remove buffer from Harpoon list' })
      vim.keymap.set('n', '<leader>Q', function()
        harpoon:list():clear()
      end, { desc = 'Remove all buffers from Harpoon list' })
      vim.keymap.set('n', '<C-e>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      vim.keymap.set('n', '<M-1>', function()
        harpoon:list():select(1)
      end)
      vim.keymap.set('n', '<M-2>', function()
        harpoon:list():select(2)
      end)
      vim.keymap.set('n', '<M-3>', function()
        harpoon:list():select(3)
      end)
      vim.keymap.set('n', '<M-4>', function()
        harpoon:list():select(4)
      end)

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set('n', '<C-S-P>', function()
        harpoon:list():prev()
      end)
      vim.keymap.set('n', '<C-S-N>', function()
        harpoon:list():next()
      end)
      -- basic telescope configuration
      -- local conf = require('telescope.config').values
      -- local function toggle_telescope(harpoon_files)
      --   local file_paths = {}
      --   for _, item in ipairs(harpoon_files.items) do
      --     table.insert(file_paths, item.value)
      --   end
      --
      --   require('telescope.pickers')
      --     .new({}, {
      --       prompt_title = 'Harpoon',
      --       finder = require('telescope.finders').new_table {
      --         results = file_paths,
      --       },
      --       previewer = conf.file_previewer {},
      --       sorter = conf.generic_sorter {},
      --     })
      --     :find()
      -- end
      --
      -- vim.keymap.set('n', '<C-e>', function()
      --   toggle_telescope(harpoon:list())
      -- end, { desc = 'Open harpoon window' })
    end,
  },
  -- Git related plugins
  'tpope/vim-fugitive',
  -- 'tpope/vim-rhubarb',

  -- Autopairs for parenthesis
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup {
        disable_filetype = { 'TelescopePrompt', 'vim' },
      }
      -- If you want insert `(` after select function or method item
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },

  -- undotree
  {
    'jiaoshijie/undotree',
    dependencies = 'nvim-lua/plenary.nvim',
    config = true,
    keys = { -- load the plugin only when using it's keybinding:
      { '<leader>u', "<cmd>lua require('undotree').toggle()<cr>", { desc = 'Open undotree' } },
    },
  },

  -- oil.nvim
  {
    'stevearc/oil.nvim',
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('oil').setup {
        columns = {
          'icon',
          -- "permissions",
          -- "size",
          -- "mtime",
        },
        keymaps = {
          ['<C-h>'] = false,
          ['<M-h>'] = {
            'actions.select',
            opts = { horizontal = true },
            desc = 'Open the entry in a horizontal split',
          },
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
    end,
  },

  -- vim-tmux-navigator
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },
}
