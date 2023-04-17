# Configure and start Oh My Zsh:

export ZSH=$HOME/.oh-my-zsh

CASE_SENSITIVE=true
DISABLE_AUTO_UPDATE=true
ZSH_THEME=agnoster

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Address an issue with syntax highlighting and copying/pasting long text:
# Note: see https://github.com/zsh-users/zsh-syntax-highlighting/issues/295.

zstyle ':bracketed-paste-magic' active-widgets '.self-*'

# buildcache:

export BUILDCACHE_DIR=~/Data/.buildcache-ubuntu
export BUILDCACHE_DIRECT_MODE=true
export BUILDCACHE_COMPRESS_FORMAT=ZSTD
export BUILDCACHE_LUA_PATH=~/.buildcache-ubuntu/lua
export BUILDCACHE_MAX_CACHE_SIZE=34359738368

# Aliases:

alias cls='clear && printf "\e[3J"'
alias cp='cp -i'
alias gpp='git pull --prune'
alias lgit='git ls-files --exclude-standard --others'
alias ll='ls -lh'
alias ls='ls --color=auto -G'
alias mv='mv -i'
alias pgit='git gc --aggressive --prune=now'
alias rgit='git reset --hard HEAD'
alias rgrep='rgrep --color=always'
alias rm='rm -i'

# Git:

export GIT_PAGER=cat

# Path:

export PATH=/Qt/5.12.12/gcc_64/bin:$PATH
