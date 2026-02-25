return {
  {
    'leath-dub/snipe.nvim',
    keys = {
      {
        'gb',
        function()
          require('snipe').open_buffer_menu()
        end,
        desc = 'Open Snipe buffer menu',
      },
    },
    opts = {
      ui = {

        open_win_override = {
          -- title = "My Window Title",
          border = 'rounded', -- use "rounded" for rounded border
        },
      },
    },
  },
}
