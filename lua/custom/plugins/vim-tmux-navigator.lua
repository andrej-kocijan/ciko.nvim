-- Seamless CTRL+<hjkl> between nvim splits and the surrounding multiplexer.
--
-- In tmux, vim-tmux-navigator handles it. In Rex, ~/.config/rex/init.lua
-- passes CTRL+<hjkl> through to nvim; the maps below move between nvim
-- splits and, at the edge of nvim's layout, hand focus back to Rex.
local function set(name) return (vim.env[name] or '') ~= '' end
local in_rex = set 'REX_BLOCK' and not set 'TMUX'

if in_rex then
  vim.g.tmux_navigator_no_mappings = 1
end

vim.pack.add { 'https://github.com/christoomey/vim-tmux-navigator' }

if in_rex then
  local directions = { h = 'left', j = 'down', k = 'up', l = 'right' }

  for key, direction in pairs(directions) do
    vim.keymap.set('n', '<C-' .. key .. '>', function()
      local win = vim.api.nvim_get_current_win()
      vim.cmd.wincmd(key)
      if vim.api.nvim_get_current_win() ~= win then return end

      -- Already at the edge of nvim's layout: move to the neighbouring Rex pane.
      -- --wrap matches the Rex-side binding.
      vim.system({ 'rex', 'focus', direction, '--wrap' }, { text = true }, function(res)
        if res.code ~= 0 then
          vim.schedule(function()
            vim.notify('rex focus ' .. direction .. ': ' .. vim.trim(res.stderr or ''), vim.log.levels.WARN)
          end)
        end
      end)
    end, { desc = 'Move focus to the ' .. direction .. ' window or Rex pane' })
  end
end
