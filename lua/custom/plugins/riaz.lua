-- NOTE personal keymap
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('i', ';;', '<Esc>A;')
vim.keymap.set('n', '<leader>pv', ':Ex<Enter>')
vim.keymap.set('n', '<S-Tab>', ':bp<Enter>', { desc = 'Go to previous buffer' })
vim.keymap.set('n', '<Tab>', ':bn<Enter>', { desc = 'Go to next buffer' })
vim.keymap.set('n', '<leader>b', '<C-6>', { desc = 'Go the most recently opened buffer' })

-- Create an autocmd for C# files
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'cs', -- This applies to C# files
  callback = function()
    vim.opt_local.tabstop = 2 -- Tabs are 4 spaces
    vim.opt_local.shiftwidth = 2 -- Indent by 4 spaces
    vim.opt_local.smartindent = true -- Enable smart indentation
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'cpp',
  callback = function()
    vim.bo.commentstring = '//%s'
  end,
})

return {}
