-- general
lvim.log.level = "warn"
lvim.format_on_save = true
vim.wo.relativenumber = true
lvim.colorscheme = "onedarker"
lvim.transparent_window = false
-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- fold the foldable code
vim.opt.foldmethod = "expr"                     -- default is "normal"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- default is ""
vim.opt.foldenable = false                      -- if this option is true and fold method option is other than normal, every time a document is opened everything will be folded.
lvim.builtin.which_key.setup.plugins.presets.z = true

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.terminal.open_mapping = "<c-t>"
lvim.keys.term_mode = { ["<C-l>"] = false }
lvim.builtin.nvimtree.setup.view.side = "left"
-- lvim.builtin.nvimtree.show_icons.git = 0


-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "javascript",
  "json",
  "lua",
  "python",
  "java",
  "yaml",
  "dart",
}


lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true



local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "black" },
  {
    name = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespace
    -- options such as `--line-width 80` become either `{"--line-width", "80"}` or `{"--line-width=80"}`
    args = { "--print-width", "100" },
    ---@usage only start in these filetypes, by default it will attach to all filetypes it supports
    filetypes = { "typescript", "typescriptreact" },
  },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { name = "flake8" },
  {
    name = "shellcheck",
    args = { "--severity", "warning" },
  },
}


-- Additional Plugins
lvim.plugins = {
  {
    "tpope/vim-surround",

    -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
    -- setup = function()
    --  vim.o.timeoutlen = 500
    -- end
  },
  -- bloc plugin
  -- {
  --   'eliasreis54/vim-bloc-plugin'
  -- },
  {
    'Neevash/awesome-flutter-snippets',
  },
  {
    'dart-lang/dart-vim-plugin'
  },
  {
    'akinsho/flutter-tools.nvim',
    config = function()
      require("flutter-tools").setup {} -- use defaults
    end
  },
  -- {
  --   'lewis6991/hover.nvim',
  --   config = function()
  --     require('hover').setup {
  --       init = function()
  --         -- Require providers
  --         require('hover.providers.lsp')
  --         -- require('hover.providers.gh')
  --         -- require('hover.providers.man')
  --         -- require('hover.providers.dictionary')
  --       end,
  --       preview_opts = {
  --         border = nil
  --       },
  --       title = true
  --     }

  --     -- Setup keymaps
  --     vim.keymap.set('n', 'K', require('hover').hover, { desc = 'hover.nvim' })
  --     vim.keymap.set('n', 'gD', require('hover').hover_doc, { desc = 'hover.nvim' })
  --     vim.keymap.set('n', 'gK', require('hover').hover_select, { desc = 'hover.nvim (select)' })
  --   end
  -- },
  -- auto format
  -- {

  -- 'nvim-lua/plenary.nvim',
  -- }
  -- todo comments
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  -- go to preview
  {
    "rmagatti/goto-preview",
    config = function()
      require('goto-preview').setup {
        width = 120,              -- Width of the floating window
        height = 25,              -- Height of the floating window
        default_mappings = false, -- Bind default mappings
        debug = false,            -- Print debug information
        opacity = nil,            -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil      -- A function taking two arguments, a buffer and a window to be ran as a hook.
        -- You can use "default_mappings = true" setup option
        -- Or explicitly set keybindings
      }
    end
  },

  -- trouble (plugin)
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  -- lsp lsp_signature (hint when you tryp)
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require "lsp_signature".on_attach() end,
  },
  -- neoscroll
  {

    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
        hide_cursor = true,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil,       -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = nil,             -- Function to run after the scrolling animation ends
      })
    end
  },
  -- colorscheme
  {
    "tiagovla/tokyodark.nvim",
  },

  -- for nextjs
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufRead",
  },
  {
    "mrjones2014/nvim-ts-rainbow",
  },
  -- -- snippets nextjs
  -- { "avneesh0612/react-nextjs-snippets" },


}
-- for rainbow parameter
lvim.builtin.treesitter.rainbow.enable = true

-- goto preview settings
vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")      -- PERF:: goto preview defination
vim.cmd("nnoremap gpD <cmd>lua require('goto-preview').goto_preview_declaration()<CR>")     -- PERF:: goto preview declaration
vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")  -- PERF:: goto preview implementation
vim.cmd("nnoremap gpt <cmd>lua require('goto-preview').goto_preview_type_definition()<CR>") -- PERF:: goto preview type defination
vim.cmd("nnoremap gpr <cmd>lua require('goto-preview').goto_preview_references()<CR>")      -- PERF:: goto preview reference
vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")

-- lvim.lsp.diagnostics.virtual_text = false
-- flutter lsp
vim.cmd("nnoremap K <Cmd>lua vim.lsp.buf.hover()<CR>")
vim.cmd("nnoremap gd <Cmd>lua vim.lsp.buf.definition()<CR>")


table.insert(lvim.plugins, {
  "zbirenbaum/copilot-cmp",
  event = "InsertEnter",
  dependencies = { "zbirenbaum/copilot.lua" },
  config = function()
    vim.defer_fn(function()
      require("copilot").setup()     -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
      require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
    end, 100)
  end,
})

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }



-- flutter plugins
lvim.builtin.which_key.mappings["F"] = {
  name = "Flutter",
  c = { ":FlutterCopyProfilerUrl<CR>", "Copy Profile Url" },
  d = { ":FlutterDevices<CR>", "Devices" },
  D = { ":FlutterDevTools<CR>", "Dev Tools" },
  e = { ":FlutterEmulators<CR>", "Emulators" },
  h = { ":FlutterReload<CR>", "Reload" },
  H = { ":FlutterRestart<CR>", "Restart" },
  l = { ":FlutterLogClear<CR>", "Log Clear" },
  o = { ":Flutterlvimutline<CR>", "lvimutline" },
  p = { ":FlutterPubGet<CR>", "Pub Get" },
  q = { ":FlutterQuit<CR>", "Quit" },
  r = { ":FlutterRun<CR>", "Run" },
  v = { ":FlutterVisualDebug<CR>", "Visual Debug" },
}

-- trouble plugins
lvim.builtin.which_key.mappings["t"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}


-- vim.opt.guifont = { "fira code", "h10" }
vim.opt.guifont = 'Iosevka:h10'
vim.g.neovide_transparency = 0.8
vim.g.neovide_cursor_vfx_mode = "railgun"

-- use neo formatter
vim.g.dart_format_on_save = 1


-- for colemak layout
-- Colemak hjkl hack
-- nnoremap <M-h> <Left>|
-- nnoremap <M-n> <Down>|
-- nnoremap <M-e> <Up>|
-- nnoremap <M-i> <Right>|
vim.cmd("nnoremap <M-m> <Left>|")
vim.cmd("nnoremap <M-n> <Down>|")
vim.cmd("nnoremap <M-e> <Up>|")
vim.cmd("nnoremap <M-i> <Right>|")
-- lvim.keys.normal_mode["d"] = "g"
-- lvim.keys.normal_mode["e"] = "k"
--
--
-- lvim.keys.normal_mode["f"] = "e"
-- lvim.keys.normal_mode["g"] = "t"
-- lvim.keys.normal_mode["i"] = "l"
-- lvim.keys.normal_mode[iii"j"] = "y"
-- lvim.keys.normal_mode["k"] = "n"
-- lvim.keys.normal_mode["l"] = "u"
-- lvim.keys.normal_mode["n"] = "j"
-- lvim.keys.normal_mode["o"] = "p"
-- lvim.keys.normal_mode["p"] = "r"
-- lvim.keys.normal_mode["r"] = "s"
-- lvim.keys.normal_mode["s"] = "d"
-- lvim.keys.normal_mode["t"] = "f"
-- lvim.keys.normal_mode["u"] = "i"
-- lvim.keys.normal_mode["y"] = "o"
-- lvim.keys.normal_mode["D"] = "G"
-- lvim.keys.normal_mode["E"] = "K"
-- lvim.keys.normal_mode["F"] = "E"
-- lvim.keys.normal_mode["G"] = "T"
-- lvim.keys.normal_mode["I"] = "L"
-- lvim.keys.normal_mode["J"] = "Y"
-- lvim.keys.normal_mode["K"] = "N"
-- lvim.keys.normal_mode["L"] = "U"
-- lvim.keys.normal_mode["N"] = "J"
-- lvim.keys.normal_mode["O"] = "P"
-- lvim.keys.normal_mode["P"] = "R"
-- lvim.keys.normal_mode["R"] = "S"
-- lvim.keys.normal_mode["S"] = "D"
-- lvim.keys.normal_mode["T"] = "F"
-- lvim.keys.normal_mode["U"] = "I"
-- lvim.keys.normal_mode["Y"] = "O"
