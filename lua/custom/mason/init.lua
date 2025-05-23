local mason_registry = require 'mason-registry'

mason_registry.refresh(function()
  local mdformat = mason_registry.get_package 'mdformat'
  local mdformat_extensions = {
    'mdformat-frontmatter',
    'mdformat-footnote',
  }

  mdformat:on('install:success', function()
    vim.schedule(function()
      vim.notify 'Installing mdformat plugins...'
    end)
    local python = mdformat:get_install_path() .. '/venv/bin/python'

    handle = vim.uv.spawn(python, {
      args = { '-m', 'pip', 'install', unpack(mdformat_extensions) },
    }, function(code, signal)
      vim.schedule(function()
        vim.notify('Exit code: ' .. code)
      end)
      handle:close()
    end)
  end)
end)
