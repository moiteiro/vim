local keymap = vim.keymap
-- Do not yank with x
keymap.set('n', 'x', '"_x')
-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')
-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

