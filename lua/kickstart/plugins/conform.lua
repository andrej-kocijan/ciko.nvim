local function gh(repo) return 'https://github.com/' .. repo end

-- [[ Formatting ]]
vim.pack.add { gh 'stevearc/conform.nvim' }
require('conform').setup {
  notify_on_error = false,
  format_on_save = {
    timeout_ms = 500,
    lsp_format = 'fallback',
  },
  default_format_opts = {
    lsp_format = 'fallback',
  },
  formatters_by_ft = {
    lua = { 'stylua' },
    markdown = { 'markdownlint' },
    bash = { 'shfmt' },
    python = { 'ruff_fix', 'ruff_format', 'ruff_organize_imports' },
    swift = { 'swiftformat' },
    c = { 'clang-format' },
    cpp = { 'clang-format' },
    json = { 'prettierd', stop_after_first = true },
    javascript = { 'prettierd', stop_after_first = true },
    typescript = { 'prettierd', stop_after_first = true },
    javascriptreact = { 'prettierd', stop_after_first = true },
    typescriptreact = { 'prettierd', stop_after_first = true },
    tex = { 'tex-fmt' },
  },
  formatters = {
    ['clang-format'] = {
      -- 4-space indent unless the project has its own .clang-format
      prepend_args = function(_, ctx)
        if vim.fs.find({ '.clang-format', '_clang-format' }, { upward = true, path = ctx.dirname })[1] then return {} end
        return { '--style={BasedOnStyle: LLVM, IndentWidth: 4}' }
      end,
    },
  },
}

vim.keymap.set({ 'n', 'v' }, '<leader>f', function() require('conform').format { async = true } end, { desc = '[F]ormat buffer' })

-- vim: ts=2 sts=2 sw=2 et
