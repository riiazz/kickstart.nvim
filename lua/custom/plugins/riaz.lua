-- NOTE personal keymap
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('x', 'v', '<Esc>')
vim.keymap.set('i', ';;', '<Esc>A;')
vim.keymap.set('n', '<leader>pv', ':Ex<Enter>')
vim.keymap.set('n', '<S-Tab>', ':bp<Enter>', { desc = 'Go to previous buffer' })
vim.keymap.set('n', '<Tab>', ':bn<Enter>', { desc = 'Go to next buffer' })
vim.keymap.set('n', '<leader>b', '<C-6>', { desc = 'Go the most recently opened buffer' })

-- Window keymap
vim.keymap.set('n', '<A-Left>', '2<C-w><', { desc = 'Decrease window width' })
vim.keymap.set('n', '<A-Right>', '2<C-w>>', { desc = 'Increase window width' })
vim.keymap.set('n', '<A-Up>', '2<C-w>+', { desc = 'Increase window height' })
vim.keymap.set('n', '<A-Down>', '2<C-w>-', { desc = 'Decrease window height' })

-- Move selected lines up/down
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv")

-- Create an autocmd for C# files
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'cs', -- This applies to C# files
  callback = function()
    vim.opt_local.tabstop = 4 -- Tabs are 4 spaces
    vim.opt_local.shiftwidth = 4 -- Indent by 4 spaces
    vim.opt_local.smartindent = true -- Enable smart indentation
    vim.opt_local.expandtab = true
    vim.opt_local.softtabstop = 4
    vim.bo.commentstring = '//%s'
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'cpp',
  callback = function()
    vim.bo.commentstring = '//%s'
  end,
})

local lspconfig = require 'lspconfig'

lspconfig.csharp_ls.setup {
  root_dir = function()
    return vim.loop.cwd()
  end,
  autostart = false,
  single_file_support = true,

  settings = {
    csharp = {
      watchForChanges = false,
      diagnostics = {
        enable = true,
      },
      exclude = {
        '**/bin/**',
        '**/obj/**',
        '**/.git/**',
        '**/node_modules/**',
        '**/node_modules/**',
      },
    },
  },
}

return {}
