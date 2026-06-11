# Add user-specific executables to PATH.
fish_add_path --prepend /opt/homebrew/bin "$HOME/.local/bin" "$HOME/go/bin" /usr/local/go/bin

set -gx BAT_THEME base16
set -gx MANPAGER "vim +MANPAGER --not-a-term -"
set -gx STARSHIP_CONFIG (string join / (set -q XDG_CONFIG_HOME; and echo $XDG_CONFIG_HOME; or echo "$HOME/.config") starship starship.toml)

if command -q vimx
    set -gx EDITOR (command -s vimx)
else
    set -gx EDITOR (command -s vim)
end

if command -q claude
    set -gx AGENT claude
else if command -q codex
    set -gx AGENT codex
end

if command -q fdfind
    alias fd fdfind
end

if command -q go-task
    alias task go-task
end

if command -q vimx
    alias vim vimx
end

abbr -a lg lazygit

starship init fish | source
