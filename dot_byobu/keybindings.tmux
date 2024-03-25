
############################################################
# my tmux bindings
############################################################

bind-key v split-window
bind-key g split-window -h

bind-key x kill-pane

# pane number display
set-option -g display-panes-active-colour default #blue
set-option -g display-panes-colour default #orange

# clock
set-window-option -g clock-mode-colour red #green

# Start numbering at 1
set -g base-index 1

# Activity monitoring
setw -g monitor-activity on
set -g visual-activity on

# hjkl pane traversal
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# set to main-horizontal, 66% height for main pane
bind m run-shell "~/.tmux/scripts/resize-adaptable.sh -l main-horizontal -p 66"
# Same thing for verical layouts
bind M run-shell "~/.tmux/scripts/resize-adaptable.sh -l main-vertical -p 50"

# open & name a new window
bind-key C command-prompt -p "Name of new window: " "new-window -n '%%'"

# color
set -g default-terminal "tmux-256color"
# NVIM COLOR FIX 07/14/20
set-option -sa terminal-overrides ',xterm-256color:RGB'

# Alacritty nvim color fix 05/26/21
# set -g default-terminal "screen-256color"
# set-option -sa terminal-overrides ',xterm-256color:Tc'
# set-option -sa terminal-overrides ',xterm-256color:RGB'

# from powerline
run-shell "tmux set-environment -g TMUX_VERSION_MAJOR $(tmux -V | cut -d' ' -f2 | cut -d'.' -f1 | sed 's/[^0-9]*//g')"
run-shell "tmux set-environment -g TMUX_VERSION_MINOR $(tmux -V | cut -d' ' -f2 | cut -d'.' -f2 | sed 's/[^0-9]*//g')"

# Vi copypaste mode
set-window-option -g mode-keys vi
if-shell "test '\( #{$TMUX_VERSION_MAJOR} -eq 2 -a #{$TMUX_VERSION_MINOR} -ge 4 \)'" 'bind-key -Tcopy-mode-vi v send -X begin-selection; bind-key -Tcopy-mode-vi y send -X copy-selection-and-cancel'
if-shell '\( #{$TMUX_VERSION_MAJOR} -eq 2 -a #{$TMUX_VERSION_MINOR} -lt 4\) -o #{$TMUX_VERSION_MAJOR} -le 1' 'bind-key -t vi-copy v begin-selection; bind-key -t vi-copy y copy-selection'

#better mouse behavior
# Make mouse useful in copy mode
set -g mouse on
setw -g mouse on

# Lower escape timing from 500ms to 50ms for quicker response to scroll-buffer access.
set -s escape-time 50
bind -n WheelUpPane if -t = "test $(echo #{pane_current_command} |grep -e 'man' -e 'less' -e 'journalctl')" "select-pane -t = ; send-keys Up Up Up Up"  "if-shell -F -t = '#{?mouse_any_flag,1,#{pane_in_mode}}' 'send-keys -M' 'select-pane -t = ; copy-mode -e; send-keys -M'"
bind -n WheelDownPane if -t = "test $(echo #{pane_current_command} |grep -e 'man' -e 'less' -e 'journalctl')" "select-pane -t = ; send-keys Down Down Down Down"  "if-shell -F -t = '#{?mouse_any_flag,1,#{pane_in_mode}}' 'send-keys -M' 'select-pane -t = ; copy-mode -e; send-keys -M'"

# 05/17/23: clear current name on (rename-window)
bind-key , command-prompt "rename-window '%%'"

# 07/05/23: make 'autoread' work in nvim
set-option -g focus-events on
unbind-key -n C-a
set -g prefix ^q
set -g prefix2 F12
bind q send-prefix
