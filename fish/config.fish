# Add user-specific executables to PATH.
fish_add_path --prepend "/opt/homebrew/bin" "$HOME/.local/bin" "$HOME/go/bin" /usr/local/go/bin

if status is-interactive
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

    set -l __eza_base "eza -l --total-size --time-style long-iso --group-directories-first --icons"

    abbr -a e $__eza_base
    abbr -a ea "$__eza_base -a"
    abbr -a et "$__eza_base -T"
    abbr -a g "git"
    abbr -a ga "git add"
    abbr -a gco "git commit --verbose"
    abbr -a gd "git diff"
    abbr -a gf "git fetch"
    abbr -a gl "git pull"
    abbr -a glgp "git log --stat --patch"
    abbr -a gp "git push"
    abbr -a gpf "git push --force-with-lease --force-if-includes"
    abbr -a gpr "git pull --rebase"
    abbr -a gst "git status"
    abbr -a gsw "git switch"
    abbr -a lg lazygit

    starship init fish | source
end
