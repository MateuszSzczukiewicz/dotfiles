export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  fast-syntax-highlighting
  zsh-autocomplete
)

source $ZSH/oh-my-zsh.sh

export GTK_THEME=Adwaita:dark

export EDITOR='nvim'
export VISUAL='nvim'

# zakomentowane bo dzialamy na i3 (X11), nie Wayland
# export MOZ_ENABLE_WAYLAND=1
# export ELECTRON_OZONE_PLATFORM_HINT=wayland
# export QT_QPA_PLATFORM=wayland
# export GDK_BACKEND=wayland

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.tmuxifier/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="$HOME/.dotnet/tools:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="/opt/mssql-tools18/bin:$PATH"
export PATH="/home/alto64/.turso:$PATH"
export PATH="/home/alto64/.lmstudio/bin:$PATH"
export PATH="$PATH:/opt/nvim/"

export PNPM_HOME="/home/alto64/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

export CPLUS_INCLUDE_PATH="/usr/include/c++/13:/usr/include/x86_64-linux-gnu/c++/13:$CPLUS_INCLUDE_PATH"


export FZF_DEFAULT_OPTS="
--color=fg:#ebdbb2,bg:#282828,hl:#fabd2f
--color=fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
--color=info:#83a598,prompt:#bdae93,pointer:#83a598
--color=marker:#fe8019,spinner:#fabd2f,header:#665c54"

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"
export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

fzfcompgen_path() {
  fd --hidden --exclude .git . "$1"
}

fzfcompgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

bindkey -s ^f "tmux-sessionizer\n"
bindkey -s '\eh' "tmux-sessionizer -s 0\n"
bindkey -s '\ej' "tmux-sessionizer -s 1\n"
bindkey -s '\ek' "tmux-sessionizer -s 2\n"
bindkey -s '\el' "tmux-sessionizer -s 3\n"


declare -A pomo_options
pomo_options["work"]="45"
pomo_options["break"]="10"

pomodoro () {
  if [[ -n "${pomo_options[$1]}" ]]; then
    local type="$1"
    local duration="${pomo_options[$type]}"
    echo "$type" | lolcat
    timer "${duration}m"
    printf "'%s' session done" "$type" | spd-say
  fi
}

alias eza="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias ls='eza -lh --group-directories-first --icons'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'

alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
alias fd='fdfind'
alias cat='bat'

alias cd='z'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias shut='shutdown -h now'
alias xdg='xdg-open'

alias n='nvim'
alias t='tmux'
alias hx='helix'
alias g='git'
alias d='docker'
alias y='yazi'
alias p='posting'
alias o='opencode'

alias lzg='lazygit'
alias lzd='lazydocker'
alias lzs='lazysql'

alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gcad='git commit -a --amend'

alias wo="pomodoro work"
alias br="pomodoro break"

eval "$(zoxide init zsh)"
eval "$(opam env)"
eval "$(thefuck --alias)"
eval "$(mise activate zsh)"

[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

[ -f "/home/alto64/.ghcup/env" ] && . "/home/alto64/.ghcup/env"
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/share/coursier/bin:$PATH"
export PATH="$HOME/.opencode/bin:$PATH"
