if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_greeting ""

# Added by Antigravity CLI installer
set -gx PATH "/home/zaddy/.local/bin" $PATH

# ~/.config/fish/config.fish: Fish shell configuration file
# Translated from ~/.bashrc

# If not running interactively, don't do anything
if not status is-interactive
    exit
end


# ==========================================
# PATH & Environment Variables
# ==========================================

# Local bin
set -gx PATH "$HOME/.local/bin" $PATH

# Rust / Cargo environment
set -gx PATH "$HOME/.cargo/bin" $PATH

# Go PATH
if type -q go
    set -gx PATH $PATH (go env GOPATH)/bin
end

# Bob (Neovim version manager) environment
# Note: env.sh is a bash script. If you have 'bass' installed (https://github.com/edolstra/bass), 
# you can load it using: bass source /home/zaddy/.local/share/bob/env/env.sh
if test -f "/home/zaddy/.local/share/bob/env/env.sh"
    # source /home/zaddy/.local/share/bob/env/env.sh # (Uncomment if using bass)
end

# Bob (Neovim version manager) binary path
set -gx PATH "$HOME/.local/share/bob/nvim-bin" $PATH

# Turso
set -gx PATH $PATH "/home/zaddy/.turso"

# opencode
set -gx PATH $PATH "/home/zaddy/.turso"

# ==========================================
# Aliases & Functions
# ==========================================

alias dir="dir --color=auto"
alias vdir="vdir --color=auto"
alias grep="grep --color=auto"
alias fgrep="grep --color=auto"
alias egrep="egrep --color=auto"

alias ls="ls -a -alF --color=auto"
alias lzd="lazydocker"

alias xampp="sudo /opt/lampp/lampp"
# Alert function for long-running commands (usage: sleep 10; alert)
function alert
    set -l last_status $status
    if test $last_status -eq 0
        set -l icon terminal
    else
        set -l icon error
    end
    notify-send --urgency=low -i $icon (history | head -n 1)
end


# ==========================================
# Notes on NVM (Node Version Manager)
# ==========================================
# NVM uses bash-specific syntax and won't run directly in Fish.
# 
# Recommended alternatives for Fish:
# 1. Install 'nvm.fish' via Fisher package manager: 
#    fisher install jorgebucaran/nvm.fish
# 2. Or use 'fnm' (Fast Node Manager), which has built-in native support for Fish.
# Fast Node Manager (FNM) setup

# Point FNM to your custom directory
set -gx FNM_DIR "$HOME/.config/nvm"
fnm env --use-on-cd | source
