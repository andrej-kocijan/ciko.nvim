vim.pack.add { 'https://github.com/catppuccin/nvim' }
require('catppuccin').setup {
  flavour = 'mocha',
  -- Enable integrations for every installed plugin (detected via vim.pack)
  auto_integrations = true,
}
vim.cmd.colorscheme 'catppuccin'
