return {
  {
    'Neevash/awesome-flutter-snippets',
  },
  {
    'akinsho/pubspec-assist.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('pubspec-assist').setup()
    end,
  },
}
