# `Neobruno`
## My mostly-from-scratch `neovim` config using `lazy.nvim` and `lua`
### Inspired by the excellent tutorials by Josean Martinez

# TODO
- [x] `nvim-cmp` is not in a good place. focus on this
  - [ ] symbol maps in cmp-window not respecting config
  - [ ] just saw documentation on this and can't find it again -- 
        TODO figure out how to hide documentation window if selected completion item has no documentation
  - [x] `nvim-cmp` bindings broken in `cmdline`; `<C-space>` broken in insert mode
  - [x] `<C-space>` in insert mode pastes from last buffer? wtf?
- [ ] `keymaps.lua`
  - [o] `hop.nvim`
    - [ ] functionalize existing keymaps - nope
    - [o] implement keymaps for other motions (e.g. `vycd`)
      - [x] implemented for `w` motion
  - [ ] misc. convenience things
    - [ ] quick-open shortcuts for common files, e.g. 
          `README.md`
          `init.lua`
          `keymaps.lua`
          etc...
- [ ] Figure out `surround` behavior
- [ ] `lsp` config:
  - [ ] `python`
  - [ ] `LaTeX`
- [ ] `obsidian` integration? or neorg? or vimwiki???

# Plugin wish-list
- https://github.com/niuiic/code-shot.nvim
- https://github.com/jbyuki/nabla.nvim
- https://github.com/chrsm/impulse.nvim
- https://github.com/epwalsh/obsidian.nvim
- https://github.com/IlyasYOY/obs.nvim
- https://github.com/clojure-vim/jazz.nvim
- https://github.com/sudormrfbin/cheatsheet.nvim
- https://github.com/saifulapm/chartoggle.nvim
- https://github.com/kevinhwang91/nvim-ufo
- https://github.com/anuvyklack/fold-preview.nvim
- https://github.com/nguyenvukhang/nvim-toggler
- https://github.com/CosmicNvim/cosmic-ui
