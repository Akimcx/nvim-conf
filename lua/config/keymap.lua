---Add a new keymap in mode
---@param mode string|table
---@param lhs string
---@param rhs string|function
---@param desc string
local function map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { noremap = true, desc = desc })
end

map({ 'n', 'i' }, '<C-b>', '<cmd>NvimTreeToggle<cr>', 'Toggle an explorer window on the left')

map('n', '<C-h>', '<C-w>h', 'Go to left window')
map('n', '<C-j>', '<C-w>j', 'Go to lower window')
map('n', '<C-k>', '<C-w>k', 'Go to upper window')
map('n', '<C-l>', '<C-w>l', 'Go to right window')

map('n', '<A-j>', '<cmd>m .+1<cr>==', 'Move down')
map('n', '<A-k>', '<cmd>m .-2<cr>==', 'Move up')
map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', 'Move down')
map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', 'Move up')
map('v', '<A-j>', ":m '>+1<cr>gv=gv", 'Move down')
map('v', '<A-k>', ":m '<-2<cr>gv=gv", 'Move up')

map({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr>', 'Save file')

-- Useful keymap for diffmode and merge confict
map('n', '<leader>mn', '<cmd>wqa<cr>', 'Save the changes and go to the next')
map('n', '<leader>mr', '<cmd>diffget RE<cr>', 'Get changes from REMOTE')
map('n', '<leader>ml', '<cmd>diffget LO<cr>', 'Get changes from LOCAL')
map('n', '<leader>mb', '<cmd>diffget BASE<cr>', 'Get changes from BASE')

map('n', '<Esc>', '<cmd>nohlsearch<CR>', 'Clear highlight on search')

map('n', '[d', vim.diagnostic.goto_prev, 'Go to previous [D]iagnostic message')
map('n', ']d', vim.diagnostic.goto_next, 'Go to next [D]iagnostic message')
map('n', '<leader>e', vim.diagnostic.open_float, 'Show diagnostic [E]rror messages')

map('n', '<leader>bc', '<cmd>bdelete<cr>', 'Close the current buffer')
map('n', '<leader>bq', '<cmd>wqa<cr>', 'Save and quit file')

map('n', '<leader>gg', '<cmd>G<cr>', 'Open the `Git` `Fugitive` window')
