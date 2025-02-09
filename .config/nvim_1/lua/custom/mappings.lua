---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },
    -- Flutter shit
    ["<leader>Fc"] = { ":FlutterCopyProfilerUrl<CR>", "Copy Profile Url" },
    ["<leader>Fd"] = { ":FlutterDevices<CR>", "Devices" },
    ["<leader>FD"] = { ":FlutterDevTools<CR>", "Dev Tools" },
    ["<leader>Fe"] = { ":FlutterEmulators<CR>", "Emulators" },
    ["<leader>Fh"] = { ":FlutterReload<CR>", "Reload" },
    ["<leader>FH"] = { ":FlutterRestart<CR>", "Restart" },
    ["<leader>Fl"] = { ":FlutterLogClear<CR>", "Log Clear" },
    ["<leader>Fo"] = { ":Flutterlvimutline<CR>", "lvimutline" },
    ["<leader>Fp"] = { ":FlutterPubGet<CR>", "Pub Get" },
    ["<leader>Fq"] = { ":FlutterQuit<CR>", "Quit" },
    ["<leader>Fr"] = { ":FlutterRun<CR>", "Run" },
    ["<leader>Fv"] = { ":FlutterVisualDebug<CR>", "Visual Debug" },
    -- goto defination
    ["gd"] = {":lua vim.lsp.buf.definition()<CR>"},
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

-- more keybinds!

return M
