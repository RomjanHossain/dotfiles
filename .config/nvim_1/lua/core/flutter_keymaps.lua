local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Flutter keybindings using <leader>F as the prefix
keymap('n', '<leader>Fc', '<Cmd>FlutterCopyProfilerUrl<CR>', opts)
keymap('n', '<leader>Fd', '<Cmd>FlutterDevices<CR>', opts)
keymap('n', '<leader>FD', '<Cmd>FlutterDevTools<CR>', opts)
keymap('n', '<leader>Fe', '<Cmd>FlutterEmulators<CR>', opts)
keymap('n', '<leader>Fh', '<Cmd>FlutterReload<CR>', opts)
keymap('n', '<leader>FH', '<Cmd>FlutterRestart<CR>', opts)
keymap('n', '<leader>Fl', '<Cmd>FlutterLogClear<CR>', opts)
keymap('n', '<leader>Fo', '<Cmd>FlutterOutline<CR>', opts) -- Fixed typo
keymap('n', '<leader>FO', '<Cmd>FlutterOutlineOpen<CR>', opts) -- Fixed typo
keymap('n', '<leader>Fp', '<Cmd>FlutterPubGet<CR>', opts)
keymap('n', '<leader>Fq', '<Cmd>FlutterQuit<CR>', opts)
keymap('n', '<leader>Fr', '<Cmd>FlutterRun<CR>', opts)
keymap('n', '<leader>Fv', '<Cmd>FlutterVisualDebug<CR>', opts)
