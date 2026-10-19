-- Render markdown in-buffer (headings, code blocks, tables, checkboxes)
vim.pack.add {
  'https://github.com/MeanderingProgrammer/render-markdown.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
}

require('render-markdown').setup {
  file_types = { 'markdown' },
}

vim.keymap.set('n', '<leader>mp', '<cmd>RenderMarkdown buf_toggle<cr>', { desc = '[M]arkdown [P]review toggle' })

-- vim: ts=2 sts=2 sw=2 et
