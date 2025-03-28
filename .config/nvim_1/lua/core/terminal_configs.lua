require('toggleterm').setup {
  open_mapping = [[<C-t>]], -- Open terminal with Ctrl+T
  shade_terminals = true,
  -- shell = "pwsh", -- Change this to your preferred shell
  direction = 'float',
  float_opts = {
    border = 'curved', -- Options: single, double, shadow, curved
    width = math.floor(vim.o.columns * 0.8),
    height = math.floor(vim.o.lines * 0.8),
  },
}

-- Function to open LazyGit in a floating terminal
local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new {
  cmd = 'lazygit',
  direction = 'float',
  hidden = true,
}

function _lazygit_toggle()
  lazygit:toggle()
end

-- Keymaps
vim.keymap.set('n', '<C-t>', '<Cmd>ToggleTerm direction=float<CR>', { noremap = true, silent = true }) -- Open floating terminal
vim.keymap.set('n', '<leader>gg', '<Cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true }) -- Open LazyGit
