-- git-conflict.nvim: highlight merge conflicts and resolve them with keymaps
-- Defaults: co (ours), ct (theirs), cb (both), c0 (none), ]x / [x (next/prev conflict)
vim.pack.add {
  { src = 'https://github.com/akinsho/git-conflict.nvim', version = 'main' },
}

require('git-conflict').setup {
  default_mappings = {
    -- prefixed with <leader> because ct / cb / c0 shadow builtin change motions
    ours = '<leader>co',
    theirs = '<leader>ct',
    both = '<leader>cb',
    none = '<leader>c0',
    next = ']x',
    prev = '[x',
  },
  default_commands = true, -- :GitConflictChooseOurs, :GitConflictListQf, ...
  disable_diagnostics = false, -- plugin calls vim.diagnostic.disable(), removed in nvim 0.12
  list_opener = 'copen', -- how :GitConflictListQf opens the list
  highlights = {
    incoming = 'DiffAdd',
    current = 'DiffText',
  },
}

-- List every conflict in the repo in the quickfix list (navigate with :cnext / :cprev)
vim.keymap.set('n', '<leader>gq', '<Cmd>GitConflictListQf<CR>', { desc = '[G]it conflicts in [Q]uickfix' })
vim.keymap.set('n', '<leader>gr', '<Cmd>GitConflictRefresh<CR>', { desc = '[G]it conflicts [R]efresh' })

-- Open all files with unresolved conflicts as args: :ConflictFiles (then :n / :N to move between them)
vim.api.nvim_create_user_command('ConflictFiles', function()
  local files = vim.fn.systemlist 'git diff --name-only --diff-filter=U'
  if vim.v.shell_error ~= 0 or #files == 0 then
    vim.notify('No conflicted files', vim.log.levels.INFO)
    return
  end
  vim.cmd('args ' .. table.concat(vim.tbl_map(vim.fn.fnameescape, files), ' '))
end, { desc = 'Open all git-conflicted files' })

-- vim: ts=2 sts=2 sw=2 et
