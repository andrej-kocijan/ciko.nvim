vim.pack.add { 'https://github.com/leath-dub/snipe.nvim' }
require('snipe').setup {
  ui = {
    open_win_override = {
      border = 'rounded',
    },
  },
}
vim.keymap.set('n', 'gb', function() require('snipe').open_buffer_menu() end, { desc = 'Open Snipe buffer menu' })
