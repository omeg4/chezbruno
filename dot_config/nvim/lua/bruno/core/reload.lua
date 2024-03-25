function _G.ReloadConfig()
  for name,_ in pairs(package.loaded) do
    if name:match('^bruno') and not name:match('nvim-tree') then
      package.loaded[name] = nil
    end
  end

  -- "Reloading your config is not supported with lazy.nvim"
  -- 🙄
  dofile(vim.env.MYVIMRC)
  vim.notify('Reloaded init.lua', vim.log.levels.INFO)
end
