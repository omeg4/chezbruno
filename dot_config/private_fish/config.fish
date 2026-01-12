if status is-interactive
  # Commands to run in interactive sessions can go here

  # 12/29/23 Update $PATH from ~/.zshrc
  fish_add_path -U "$HOME/.local/share/applications" "$HOME/Documents/.allmystuff/bin" "$HOME/perl5/bin" "$HOME/.luarocks/bin" "$HOME/.local/share/bob/nvim-bin" "$HOME/.pyenv"

  # 10/20/25 define $EDITOR, $BROWSER
  # https://www.reddit.com/r/fishshell/comments/jme5ks/how_do_i_set_editor_to_nvim_in_fish_shell/
  set -gx EDITOR nvim
  set -gx BROWSER vivaldi-snapshot

  # `pj` plugin config - define project directories
  set -U PROJECT_PATHS "HOME/poedev" "HOME/poedev/DashOfExile/" "HOME/Documents/.allmystuff/bin/" "HOME/.config/awesome" "HOME/.config/fish" "HOME/.config/nvim" "HOME/.config/wezterm/"

  # Trick to expand abbreviations w/o trailing space
  bind " " expand-abbr or self-insert

  source "$HOME/.config/fish/abbr.fish"
  source "$HOME/.config/fish/.secrets.fish"

  # Moved inside `if status is-interactive` block, after seeing errors in TTY shell. {{{
  # https://devhints.io/fish-shell

  # Replaced starship with tide, i.e. `fisher install IlanCosman/tide@v6`
  # starship init fish | source

  zoxide init fish | source

  # source "$HOME/.asdf/asdf.fish"
  # }}}

  # No, Claude. NO. BAD BOT.
  # I'm not entering my Git SSH pass every time I open a damn terminal lmao.
  # Auto-start ssh-agent
  # if not set -q SSH_AUTH_SOCK
  #   eval (ssh-agent -c)
  #   ssh-add ~/.ssh/id_ed25519
  # end
  # Instead use Keyring integration
  # Be sure we're auto-starting `gnome-keyring-daemon --start --components=ssh` somewhere
  if not set -q SSH_AUTH_SOCK
    set -x SSH_AUTH_SOCK /run/user/(id -u)/keyring/ssh
  end

end

# Created by `pipx` on 2025-11-03 15:04:32
set PATH $PATH /home/bruno/.local/bin
