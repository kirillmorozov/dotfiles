# Add XDG user-specific executables to PATH
export PATH="$HOME/.local/bin:$PATH"
# Add go to path
export PATH="$HOME/go/bin:/usr/local/go/bin:$PATH"
# Add OpenCode to the PATH
export PATH="$HOME/.opencode/bin:$PATH"
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Auto-update behavior
zstyle ':omz:update' frequency 7
zstyle ':omz:update' mode auto # update automatically without asking

COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  ansible
  aws
  brew
  command-not-found
  common-aliases
  dnf
  fzf
  gh
  git
  git-auto-fetch
  golang
  helm
  kubectl
  podman
  python
  systemd
  terraform
  ubuntu
  uv
  vscode
)

source $ZSH/oh-my-zsh.sh

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

# opencode
