-- lazygit inside Neovim (requires the `lazygit` binary on PATH)
vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/kdheepak/lazygit.nvim',
}

vim.keymap.set('n', '<leader>lg', '<Cmd>LazyGit<CR>', { desc = '[L]azy[G]it', silent = true })

-- vim: ts=2 sts=2 sw=2 et
