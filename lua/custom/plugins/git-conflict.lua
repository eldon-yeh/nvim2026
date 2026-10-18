-- git-conflict.nvim: highlight merge conflicts and resolve them with keymaps
-- Defaults: co (ours), ct (theirs), cb (both), c0 (none), ]x / [x (next/prev conflict)
vim.pack.add {
  { src = 'https://github.com/akinsho/git-conflict.nvim', version = 'main' },
}

require('git-conflict').setup()

-- vim: ts=2 sts=2 sw=2 et
