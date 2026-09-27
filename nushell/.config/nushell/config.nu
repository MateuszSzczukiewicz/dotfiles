# Nushell config (interactive shell)

$env.config.show_banner = false
$env.config.edit_mode = "emacs"
$env.config.table.mode = "rounded"
$env.config.history.file_format = "sqlite"
$env.config.history.max_size = 100_000
$env.config.history.sync_on_enter = true
$env.config.filesize.metric = true
$env.config.buffer_editor = "nvim"

source ~/.cache/nushell/zoxide.nu
source ~/.cache/nushell/mise.nu
source ~/.cache/nushell/starship.nu
use ~/.cache/nushell/niri.nu *

alias z = __zoxide_z
alias zi = __zoxide_zi

def fuzzy-open [] {
    let file = (fd --type f --hidden --exclude .git | fzf --preview 'bat --style=numbers --color=always {}')
    if not ($file | is-empty) {
        ^xdg-open $file
    }
}

def --env mkcd [dir: string] {
    mkdir $dir
    cd $dir
}

def ports [] {
    ss -tulpn
}

alias ls = eza --icons --group-directories-first
alias l = eza --icons --group-directories-first --long --git
alias ll = eza --icons --group-directories-first --long --git
alias la = eza --icons --group-directories-first --long --git --all
alias lt = eza --icons --group-directories-first --tree --level=2
alias lta = eza --icons --group-directories-first --tree --level=2 --all
alias cat = bat
alias grep = rg
alias ps = procs
alias top = procs
alias n = nvim
alias v = nvim
alias t = tmux
alias g = git
alias d = docker
alias y = yazi
alias p = posting
alias o = opencode
alias lzg = lazygit
alias lzd = lazydocker
alias lzs = lazysql
alias shut = shutdown -h now
alias xdg = xdg-open
alias gcm = git commit -m
alias gcam = git commit -a -m
alias gcad = git commit -a --amend
alias f = fuzzy-open

alias .. = cd ..
alias ... = cd ../..
alias .... = cd ../../..
