vim.pack.add { 'https://github.com/catppuccin/nvim' }
require('catppuccin').setup {
  flavour = 'mocha',
  integrations = {
    cmp = false,
    mason = true,
    gitsigns = true,
    nvimtree = true,
    telescope = true,
  },
}
vim.cmd.colorscheme 'catppuccin'
