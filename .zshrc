# Set path
#export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:/usr/local/go/bin:$PATH

# Set up the prompt
#autoload -Uz promptinit
#promptinit
#prompt elite

setopt histignorealldups sharehistory

# Aliases
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias grep='grep --color=auto'
alias d="docker"
alias dps="docker ps"
alias ec="$EDITOR $HOME/.zshrc"
alias sc="source $HOME/.zshrc"
alias sn="$HOME/Apps/standard-notes-3.4.10-linux-x86_64.AppImage --no-sandbox &"


# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history

# Use modern completion system
#autoload -Uz compinit
#compinit

## zplug

if [ ! -d ~/.zplug ]; then
  echo zplug is not installed. Installing...
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
  echo Plugin installation will start shortly...
  sleep 5
fi

source ~/.zplug/init.zsh

# list of plugins
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/kubectl", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "junegunn/fzf"
#zplug "themes/robbyrussell", from:oh-my-zsh, as:theme
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

# install plugins if required
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load --verbose

## Adjust prompt for spaceship plugin
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  julia         # Julia section
  docker        # Docker section
  aws           # Amazon Web Services section
  gcloud        # Google Cloud Platform section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  dotnet        # .NET section
  ember         # Ember.js section
  kubectl       # Kubectl context section
  terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_HOST_SHOW='always'
SPACESHIP_USER_SHOW='always'
#PROMPT="$fg[cyan]%}$USER@%{$fg[blue]%}%m ${PROMPT}"
