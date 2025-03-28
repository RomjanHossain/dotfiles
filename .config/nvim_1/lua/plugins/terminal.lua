return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require 'core.terminal_configs' -- Ensure the config loads after the plugin
  end,
}
