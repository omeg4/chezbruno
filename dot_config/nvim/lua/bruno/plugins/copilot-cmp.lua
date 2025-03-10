return {
  'zbirenbaum/copilot-cmp',
  dependencies = { 'zbirenbaum/copilot.lua' },
  config = function ()
    require('copilot').setup()
  end,
}
