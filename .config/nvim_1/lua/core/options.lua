-- relative number
vim.wo.relativenumber = true
vim.wo.number = true

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true
-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- tabstop and shiftwidth
vim.o.shiftwidth = 4
vim.o.tabstop = 4 -- Insert n spaces for a tab (default: 8)
vim.o.softtabstop = 4 -- Number of spaces that a tab counts for while performing editing operations (default: 0)
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
vim.o.sidescrolloff = 8 -- Minimal number of screen columns either side of cursor if wrap is `false` (default: 0)
-- Show which line your cursor is on
vim.opt.cursorline = true
-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false
-- Make indenting smarter again (default: false)
vim.o.smartindent = true
-- Always show tabs (default: 1)
vim.o.showtabline = 2
-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'
-- Enable break indent
vim.opt.breakindent = true
-- Decrease update time
vim.opt.updatetime = 250
-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300
-- Save undo history
vim.opt.undofile = true
vim.opt.termguicolors = true -- Set termguicolors to enable highlight groups (default: false)
