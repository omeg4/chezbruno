if status is-interactive
  # Commands to run in interactive sessions can go here
  if not set -q ZELLIJ
    exec zellij
  end

  # 12/29/23 Update $PATH from ~/.zshrc
  fish_add_path -U "$HOME/.local/share/applications" "$HOME/Documents/.allmystuff/bin" "$HOME/perl5/bin" "$HOME/.luarocks/bin" "$HOME/.local/share/bob/nvim-bin" "$HOME/.pyenv"
  fish_add_path -U "$HOME/.local/share/gem/ruby/3.4.0/bin"

  # 10/20/25 define $EDITOR, $BROWSER
  # https://www.reddit.com/r/fishshell/comments/jme5ks/how_do_i_set_editor_to_nvim_in_fish_shell/
  set -gx EDITOR nvim
  set -gx BROWSER vivaldi

  # `pj` plugin config - define project directories
  set -U PROJECT_PATHS "HOME/poedev" "HOME/poedev/DashOfExile/" "HOME/Documents/.allmystuff/bin/" "HOME/.config/awesome" "HOME/.config/fish" "HOME/.config/nvim" "HOME/.config/wezterm/"

  # Trick to expand abbreviations w/o trailing space
  bind " " expand-abbr or self-insert

  source "$HOME/.config/fish/abbr.fish"
  source "$HOME/.config/fish/.secrets.fish"

  # Throws an error b/c of bash/fish syntax
  # source "/usr/share/nvm/init-nvm.sh"

  # Moved inside `if status is-interactive` block, after seeing errors in TTY shell. {{{
  # https://devhints.io/fish-shell

  # Replaced starship with tide, i.e. `fisher install IlanCosman/tide@v6`
  # starship init fish | source

  zoxide init fish | source

  # source "$HOME/.asdf/asdf.fish"
  # }}}

  # exec zellij

end

# Created by `pipx` on 2025-11-11 20:30:02
set PATH $PATH /home/bruno/.local/bin
