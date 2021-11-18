
ISDARWIN=$([ $(uname) = "Darwin" ])
if $ISDARWIN; then
	# Shopify dev and nix stuff
	[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
	if [ -e ${HOME}/.nix-profile/etc/profile.d/nix.sh ]; then . ${HOME}/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
fi

# --- History
setopt share_history hist_ignore_space extended_history hist_reduce_blanks
setopt hist_ignore_all_dups hist_ignore_dups hist_expire_dups_first hist_find_no_dups hist_save_no_dups
HISTFILE=${HOME}/.cache/zsh/histfile
HISTSIZE=4000
SAVEHIST=3500
setopt interactive_comments # For hashtags in history

# --- Keymap
bindkey -e # Emacs default

# --- Completion
setopt hist_verify # Don't execute immediately on completion

# > Complist
zmodload -i zsh/complist
setopt auto_menu auto_list
zstyle ':completion:*' show-ambiguity 'true'
zstyle ':completion:*' show-completer 'true'
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' group-name ''
zstyle ':completion:*' separate-sections 'true'
zstyle ':completion:*' use-cache on
#zstyle ':completion:*' file-list 'true' # ls -l format (need colors)
#zstyle ':completion:*' gain-privileges 'true' # For sudo things
zstyle ':completion:*:descriptions' format '--- %d ---'

autoload -Uz compinit
# This check is needed since I use a company managed macbook
if $ISDARWIN; then
    compinit -u
else
    compinit
fi

# --- Misc
setopt autocd extendedglob notify
unsetopt beep

# > cdr (recent dirs with completion)
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# > tetris
autoload -Uz tetris
zle -N tetris
bindkey '^Xt' tetris

# --- Golang
export GOPATH=${HOME}/go
path+=("${GOPATH}/bin")

# --- Ruby
[[ -f /opt/dev/sh/chruby/chruby.sh ]] && type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }

# --- broot
source ${HOME}/.config/broot/launcher/bash/br


# --- Path and aliases
alias ls='ls -G'
alias ll='ls -lG'
alias gs='git status'`
export PATH

# cloudplatform: add Shopify clusters to your local kubernetes config
export KUBECONFIG=${KUBECONFIG:+$KUBECONFIG:}/Users/jadebilkey/.kube/config:/Users/jadebilkey/.kube/config.shopify.cloudplatform
if [ -e /Users/jadebilkey/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/jadebilkey/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

[[ -x /usr/local/bin/brew ]] && eval $(/usr/local/bin/brew shellenv)
