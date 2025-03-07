return {
  'zbirenbaum/copilot-cmp',
  dependencies = { 'zbirenbaum/copilot.lua' },
  enabled = false,
  config = function ()
    require('copilot').setup()
  end,
}
