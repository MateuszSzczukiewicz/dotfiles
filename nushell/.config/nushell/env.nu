# Nushell environment config (loads before config.nu)

$env.LANG = "en_US.UTF-8"
$env.LANGUAGE = "en"
$env.LC_MESSAGES = "en_US.UTF-8"

$env.EDITOR = "nvim"
$env.VISUAL = "nvim"
$env.GTK_THEME = "Adwaita:dark"
$env.LIBVIRT_DEFAULT_URI = "qemu:///system"
$env.RIPGREP_CONFIG_PATH = $"($env.HOME)/.config/ripgrep/config"
$env.ANDROID_HOME = $"($env.HOME)/Android/Sdk"

$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join "scripts")
    ($nu.data-dir | path join "completions")
]

$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join "plugins")
]

let extra_path = [
    $"($env.HOME)/.local/share/bob/nvim-bin"
    $"($env.HOME)/.opencode/bin"
    $"($env.HOME)/.local/share/coursier/bin"
    $"($env.HOME)/.cargo/bin"
    $"($env.HOME)/.local/share/pnpm"
    $"($env.HOME)/.lmstudio/bin"
    $"($env.HOME)/.turso"
    "/opt/mssql-tools18/bin"
    $"($env.HOME)/bin"
    $"($env.HOME)/.dotnet/tools"
    $"($env.HOME)/.config/emacs/bin"
    $"($env.HOME)/.rbenv/bin"
    $"($env.HOME)/go/bin"
    $"($env.HOME)/.tmuxifier/bin"
    $"($env.HOME)/.local/bin"
    "/opt/nvim"
    $"($env.ANDROID_HOME)/cmdline-tools/latest/bin"
    $"($env.ANDROID_HOME)/emulator"
    $"($env.ANDROID_HOME)/platform-tools"
]

let base_path = if ($env.PATH | describe) == "string" {
    $env.PATH | split row (char esep)
} else {
    $env.PATH
}

$env.PATH = ($extra_path | append $base_path | uniq)

let flatpak_share_dirs = (
    (["/var/lib/flatpak" $"($env.HOME)/.local/share/flatpak"] | each {|base| $"($base)/exports/share" })
    | append (try { ^flatpak --installations | lines | each {|p| $"($p)/exports/share" } } catch { [] })
)

let base_data_dirs = if ($env.XDG_DATA_DIRS? | is-empty) {
    ["/usr/local/share" "/usr/share"]
} else {
    $env.XDG_DATA_DIRS | split row ":"
}

$env.XDG_DATA_DIRS = (
    $flatpak_share_dirs
    | append $base_data_dirs
    | uniq
    | where {|dir| ($dir | path type) == "dir" }
    | str join ":"
)

let nu_cache = $nu.cache-dir
mkdir $nu_cache

if (which zoxide | is-not-empty) {
    zoxide init nushell --cmd cd | save -f ($nu_cache | path join "zoxide.nu")
} else {
    "# zoxide not installed" | save -f ($nu_cache | path join "zoxide.nu")
}

if (which mise | is-not-empty) {
    mise activate nu | save -f ($nu_cache | path join "mise.nu")
} else {
    "# mise not installed" | save -f ($nu_cache | path join "mise.nu")
}

if (which niri | is-not-empty) {
    niri completions nushell | save -f ($nu_cache | path join "niri.nu")
} else {
    "# niri not installed" | save -f ($nu_cache | path join "niri.nu")
}

if (which starship | is-not-empty) {
    starship init nu | save -f ($nu_cache | path join "starship.nu")
} else {
    "# starship not installed" | save -f ($nu_cache | path join "starship.nu")
}
