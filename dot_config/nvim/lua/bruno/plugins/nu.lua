return {
  'LhKipp/nvim-nu',
  build = ':TSInstall nu',
  config = function()
    require('nu').setup({})
  end,
}
