return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
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
    end,
  },
}
