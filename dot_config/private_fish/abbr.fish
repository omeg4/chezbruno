# Basic Stuff
abbr -a cl 'clear && neofetch'
abbr -a gofish 'source $HOME/.config/fish/config.fish'

abbr -a syre 'systemctl reboot'
abbr -a sypo 'systemctl poweroff'

# `cd ...` shortcuts
abbr -a cdchez 'cd $HOME/.local/share/chezmoi/'
abbr -a cdconf 'cd $HOME/.config/'
abbr -a cdmybin 'cd $HOME/Documents/.allmystuff/bin/'
abbr -a cddoe 'cd $HOME/poedev/DashOfExile && pipenv shell'
abbr -a cdstm 'cd $HOME/.steam/steam/steamapps/common/'
abbr -a cdrez 'cd $HOME/resume/altacv-mnb'

# `ls` -> `lsd`
abbr -a ls 'lsd '
abbr -a ll 'lsd -al '
abbr -a lst 'lsd -alt '
abbr -a lss 'lsd -als '

# Git related shortcuts
abbr -a lg 'lazygit'
## FUCKYOUFUCKYOUFUCKYOUFUCKYOUFUCKYOUFUCKYOUFUCKYOU
# abbr -a lgy 'lazygit --git-dir=/home/bruno/.local/share/yadm/repo.git/ --work-tree=/home/bruno'

abbr -a gs 'git status'
abbr -a ga 'git add'
abbr -a gaa 'git add .'
abbr -a gcm 'git commit -m '
abbr -a gcam 'git commit -am '
abbr -a gp 'git push'

# Fisher shorties
abbr -a fins 'fisher install '

# App short names
abbr -a ra 'ranger'

# Logitech G502 Controls
abbr -a rbc 'ratbagctl'
abbr -a rbl 'ratbagctl list'
abbr -a rbg 'ratbagctl booming-agouti '
# abbr -a rbps 'ratbagctl booming-agouti profile active set '

# Edit file shortcuts
abbr -a efs 'nvim $HOME/.config/fish/'
abbr -a efa 'nvim $HOME/.config/fish/abbr.fish'
abbr -a envim 'nvim $HOME/.config/nvim/'
abbr -a eam 'nvim $HOME/.config/awesome/'
abbr -a ewt 'nvim $HOME/.config/wezterm/wezterm.lua'
abbr -a est 'nvim $HOME/.config/starship.toml'

# SSH
abbr -a sshpi 'ssh raspberrypi.local'

# Wine
abbr -a wpob 'wine $HOME/Documents/Path of Building Community/Path of Building.exe &'
