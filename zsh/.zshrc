# Add XDG user-specific executables to PATH
export PATH="$HOME/.local/bin:$PATH"
# Add go to path
export PATH="$HOME/go/bin:/usr/local/go/bin:$PATH"
# Add cargo to path
export PATH="$HOME/.cargo/bin:$PATH"

COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
autoload -U compinit; compinit
setopt EXTENDED_HISTORY
setopt autocd

source <(fzf --zsh)

# User configuration
export BAT_THEME="base16"
export EDITOR='vim'
export MANPAGER="vim +MANPAGER --not-a-term -"
export STARSHIP_CONFIG=${XDG_CONFIG_HOME:-$HOME/.config}/starship/starship.toml

########################################
# Switch cinnamon theme using gsettings.
# Global:
#   COLOR_SCHEME: Could be either 'prefer-light' or 'prefer-dark'.
#   GTK_THEME: A GTK theme to use for the interface.
########################################
switch_cinnamon_theme() {
  if ! command -v gsettings &> /dev/null; then
    echo "gsettings is not available" >&2
    return 1
  fi
  case "${COLOR_SCHEME:?variable is not set}" in
    prefer-light | prefer-dark) ;;
    *)
      echo "Invalid COLOR_SCHEME value, must be either prefer-light or prefer-dark" >&2
      return 1
      ;;
  esac
  gsettings set org.cinnamon.desktop.interface gtk-theme "${GTK_THEME:?variable is not set}"
  gsettings set org.cinnamon.theme name "${GTK_THEME}"
  gsettings set org.gnome.desktop.interface gtk-theme "${GTK_THEME}"
  gsettings set org.x.apps.portal color-scheme "${COLOR_SCHEME:?variable is not set}"
}

switch_to_light_mode() {
  local GTK_THEME=Mint-Y-Red
  local COLOR_SCHEME=prefer-light
  switch_cinnamon_theme
}

switch_to_dark_mode() {
  local GTK_THEME=Mint-Y-Dark-Red
  local COLOR_SCHEME=prefer-dark
  switch_cinnamon_theme
}

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
if command -v fdfind &> /dev/null; then
  alias fd="fdfind"
fi
if command -v go-task &> /dev/null; then
  alias task="go-task"
fi
alias da='switch_to_dark_mode'
alias e='eza -l --total-size --time-style long-iso --group-directories-first --icons'
alias ea='e -a'
alias et='e -T'
alias lg="lazygit"
alias li='switch_to_light_mode'

eval "$(starship init zsh)"
